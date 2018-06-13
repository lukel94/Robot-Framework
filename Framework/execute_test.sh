#!/bin/bash
TEAMNAME="none"
TESTTYPE="both"
if [ $# -eq 0 ]; then
	echo "Error: Invalid commandline."
	echo "Usage: sh execute_test.sh -team <team-name> [-test <test-type/file-name>]"
else
	arg=($@)
	for (( i=0;i<$#;i+=2 ))
	do
	    case ${arg[$i]} in
	    -team)
		TEAMNAME="${arg[$i+1]}"
		if [ \( ! -z "$TEAMNAME" \) -a \( -d "../UCC/$TEAMNAME" \) ]; then
			echo "true team"
		else
			echo "Invalid team name"
			exit 0
		fi
	    ;;
	    -test)
		TESTTYPE="${arg[i+1]}"
		if [ -d "$TESTTYPE" ]; then
			echo "true type"
		elif [ \( -f "./req/ucc_test_suites/$TESTTYPE" \) -o \( -f "./lang/ucc_test_suites/$TESTTYPE" \) ]; then
			echo "file"
		else
			echo "Invalid test type"
			exit 0
		fi
	   ;;
	   *)
	    echo "Invalid switch"
	    exit 0
	    esac
	done
    # test_suite=$1
fi
if [ $TEAMNAME = "none" ]; then
	echo "-team is mandatory"
	exit 0
fi

make -C ../UCC/$TEAMNAME
cp ../UCC/$TEAMNAME/bin/UCC ./ucc_executables/
mkdir -p output/tmp


if [ $TESTTYPE == "both" ]; then
	test_suite="req/ucc_test_suites"
	robot -d output/tmp $test_suite
	python execute_test_archive.py	$TEAMNAME req
    rm -rf output/tmp
    mkdir -p output/tmp
    cp -R lang/output_tmp/* output/tmp
	test_suite="lang/ucc_test_suites"
	robot -d output/tmp $test_suite
	python execute_test_archive.py	$TEAMNAME lang

elif [ $TESTTYPE == "req" ]; then
	test_suite="req/ucc_test_suites"
	robot -d output/tmp $test_suite
	python execute_test_archive.py	$TEAMNAME req

elif [ $TESTTYPE == "lang" ]; then
	test_suite="lang/ucc_test_suites"
    cp -R lang/output_tmp/* output/tmp
	robot -d output/tmp $test_suite
	python execute_test_archive.py	$TEAMNAME lang

elif [ -f "./req/ucc_test_suites/$TESTTYPE" ]; then
	test_suite="req/ucc_test_suites/$TESTTYPE"
	robot -d output/tmp $test_suite
	python execute_test_archive.py	$TEAMNAME $TESTTYPE

else
	test_suite="lang/ucc_test_suites/$TESTTYPE"
    cp -R lang/output_tmp/* output/tmp
	robot -d output/tmp $TESTTYPE
	python execute_test_archive.py	$TEAMNAME $TESTTYPE
fi

rm -rf output/tmp
rm -rf ../UCC/$TEAMNAME/*
rm ucc_executables/UCC	



