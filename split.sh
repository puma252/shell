cmd="sed -n"
while getopts "s:e:f:h" args;do
    case $args in
        h | --help)
            echo "get top 5 lines of test.c:"
            echo "sed -s 1 -e 5 -f test.c"
            exit 0
            ;;
        s | startline)
            cmd=$cmd" \"$OPTARG"
            ;;
        e | endline)
            cmd=$cmd",$OPTARG"
            cmd=$cmd"p\""
            ;;
        f | file)
            cmd=$cmd" $OPTARG"
            ;;
    esac
done

eval $cmd
