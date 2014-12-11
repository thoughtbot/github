{-# LANGUAGE OverloadedStrings #-}
-- | The organization teams API as described on
-- <https://developer.github.com/v3/orgs/teams/>
module Github.Organizations.Teams (
 addUserToTeam
,userTeams
,module Github.Data
) where

import Github.Data
import Github.Private
import Network.HTTP.Types (Status)

addUserToTeam :: GithubAuth -> Int -> String -> IO (Either Error Status)
addUserToTeam auth teamId username =
    doHttpsStatus "PUT" (buildUrl ["teams", show teamId, "memberships", username]) auth Nothing

userTeams :: GithubAuth -> IO (Either Error [GithubTeam])
userTeams auth = githubGet' (Just auth) ["user", "teams"]
