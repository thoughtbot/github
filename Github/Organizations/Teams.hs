-- | The organization teams API as described on
-- <https://developer.github.com/v3/orgs/teams/>
module Github.Organizations.Teams (
 userTeams
,module Github.Data
) where

import Github.Data
import Github.Private

userTeams :: GithubAuth -> IO (Either Error [GithubTeam])
userTeams auth = githubGet' (Just auth) ["user", "teams"]
