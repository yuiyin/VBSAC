# Repository of VBSAC

### Introduction of VBSAC

Currently, we are try our best to implement LLVM API in Java. Therefore, our tool may not support all the features in LLVM. If you meet any problems, please feel free to email me at guzx14@mails.tsinghua.edu.cn.

### Benchmark Composition

All the benchmark test cases are listed in `benchmark` folder. All the cases either from widely-used benchmarks or real-world projects. We have modified some of them, including fixing irrelevant bugs, re-organizing the files for better precision and recall testing and so on. Currently, we only summarize the pointer-range relevant cases. All the bug details are summarized in `benchmark/benchmark_bug_details.xlsx`. We are appreciate to receive any suggestions.

* [ITC](https://github.com/regehr/itc-benchmarks)
* [Juliet Test Suite for C/C++ V1.3](https://samate.nist.gov/SRD/testsuite.php)

### Evaluation with the state-of-the-art static analysis tools

To evaluate the state-of-the-art static analysis tools, we have conducted an experiment on the benchmark. We have listed the tool information as below. All the results can be found in `result`. To reproduce the results, we have uploaded the scripts to get the results by authors. All the scripts are in `helper`.

**Notice: please install the tools before evaluation.**

* Cppcheck

  * Homepage: http://cppcheck.sourceforge.net/

  * Usage:

    ```shell
    # open VBSAC
    cd path/VBSAC
    # check cppcheck version
    cppcheck --version
    # copy the cppcheck.sh to VBSAC
    cp helper/cppcheck/cppcheck.sh . 
    # run the script
    bash cppcheck.sh
    # result will be saved in cppcheck_result.txt
    ```

* Clang Static Analyzer

  * Homepage: http://clang-analyzer.llvm.org/

  * Usage

    ```shell
    # open VBSAC
    cd path/VBSAC
    # check clang version
    clang --version
    # copy the clang.sh to VBSAC
    cp helper/clang/clang.sh . 
    # run the script
    bash clang.sh
    # result will be saved in clang_result.txt
    ```

* facebook Infer

  * Homepage: http://fbinfer.com/

  * Usage: **Because Infer does not support integer analysis, we use the benchmark_ptr for evaluation.**

    ```shell
    # open VBSAC
    cd path/VBSAC
    # check Infer version
    infer --version
    # copy the infer.sh to VBSAC
    cp helper/infer/infer.sh . 
    # run the script
    bash infer.sh
    # result will be saved in infer_result.txt
    ```

* PVS-Studio Analyzer

  * Homepage: http://www.viva64.com/en/pvs-studio/

  * Usage for free open source purpose: https://www.viva64.com/en/b/0457/

    * We have added the comments in each test case.

  * Usage

    ```shell
    # open VBSAC
    cd path/VBSAC
    # check PVS version
    pvs-studio --version
    # copy the pvs.sh, pvs_single.sh, PVS-Studio.cfg, pvs_summary.py to VBSAC
    cp helper/pvs/pvs.sh .
    cp helper/pvs/pvs_single.sh .
    cp helper/pvs/PVS-Studio.cfg .
    cp helper/pvs/pvs_summary.py .
    # run the script
    bash pvs.sh
    # the original results will be save in pvs-original folder
    # then, the pvs_summary will filter the original results and save the final result in pvs_result.txt
    ```

* 


