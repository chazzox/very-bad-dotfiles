import os
from git import Repo, InvalidGitRepositoryError

folders = [i for i in os.listdir(".") if os.path.isdir(i)]

for repo in folders:
    print("\nInspecting folder: %s" % repo)
    try:
        temp_repo = Repo(repo)
        if temp_repo.is_dirty():
            untracked = temp_repo.untracked_files
            print("%s contains untracked files, cannot update" % repo )
            continue
        
        print("Pulling...")
        print(temp_repo.remotes.origin.pull())

    except InvalidGitRepositoryError:
        print("Error: %s is not a git repository" % repo)
