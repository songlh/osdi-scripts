import os
import subprocess
import time
import statistics


def create_if_not_exist(path):
    if not os.path.exists(path):
        os.mkdir(path)


def parseExecutionTime(stdout):
    return float(stdout.decode("utf-8").split()[-1].strip().replace('s', ''))


def readConfig():
    with open('bug-info.txt', 'r') as fd:
        line = fd.readline()
        items = line.split(',')
        bugno = int(items[0])
        test_path = items[1]
        commit_no = items[2]
        test_cases = items[3:]
    return bugno, test_path, commit_no, test_cases


def executeTestCases(testcases):
    for testcase in testcases:
        times = []
        for i in range(1, 10):
            stdout = subprocess.check_output("go test -run "+testcase, shell=True)
            exe_time = parseExecutionTime(stdout)
            times.append(exe_time)
            print(exe_time)
        print(statistics.mean(times), " ".join([str(x) for x in times]))

#put this script in the dir named as 'project-bugid'
#by running the script, we can test the running time before the patch and after the patch
#the test path should include the go get path

if __name__ == "__main__":
    bugno, test_path, commit_no, test_cases = readConfig()
    workdir = os.getcwd()
    os.environ["GOPATH"] = workdir
    bug_path = os.path.join(workdir, 'src', test_path)
    proj_path = os.path.join(workdir, 'src')
    print(bug_path)
    os.chdir(bug_path)
    print("git reset...")
    os.system("git reset --hard "+commit_no)
    executeTestCases(test_cases)
    os.chdir(proj_path)
    os.system("../../../my_tools/bin/gl_1_patcher" + " " + str(bugno) + " " + os.path.join(workdir, "../bug_list.txt"))
    os.chdir(bug_path)
    executeTestCases(test_cases)

