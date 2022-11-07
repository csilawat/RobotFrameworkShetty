import os
import time
import git
from git import RemoteProgress


class CloneProgress(RemoteProgress):
    def update(self, op_code, cur_count, max_count=None, message=''):
        if message:
            print(message)


# print('Cloning into %s' % git_root)
git.Repo.clone_from('https://github.com/csilawat/RobotFrameworkShetty.git',"C:/Users/csilawat/PycharmProjects/RobotFramworkDemo/GitDB_Project",
                    branch='master', progress=CloneProgress())
os.system()