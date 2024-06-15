#!/bin/sh

do_something_based_on_number() {
    case $1 in
        1)
            echo "1..."
            ;;
        2)
            echo "2..."
            ;;
        3)
            echo "3..."
            ;;
        4)
            echo "4..."
            ;;
        *)
            echo "Unknown: $1"
            ;;
    esac
}

while true; do
    read -p "(1-4) or 'q' exit: " number

    if [ "$number" = "q" ]; then
        break
    fi

    do_something_based_on_number "$number"

    sleep 1
done

echo "done"
exit 0
