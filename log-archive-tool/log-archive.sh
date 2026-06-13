#!/bin/env bash


#==================================#
# A SCRIPT THAT ARCHIVES LOG FILES #
#==================================#


# VAR Initialisation
DESTINATION=""

for argument in $*; do
    case "$1" in 
        -d|--directory) 
            DESTINATION="$2"
            break ;;

    esac
done
echo "$*"
DESTINATION=${DESTINATION:-"/backup"}

# Verifies that the directory exists
if ! [[ -d $DESTINATION ]]; then
    echo "THE DESTINATION $DESTINATION DO NOT EXIST. EXITING...."
    exit 1
fi

echo "PROCEEDING TO ARCHIVING"
for argument in $*; do
    case "$1" in
        -d|--directory) 
            shift 2 ;;
        --) # end of arguments
            shift 
            break ;;
        -*) # unkown arguments
            echo "$(date +%Y-%m-%d_%H:%M:%S)_-_UNKNOWN ARGUMENT. EXITING...."
            exit 1 ;;
        *)
            # Verifies if the directory exists
            if  ! [[ -d "$1" ]] ; then
                echo "$(date +%Y-%m-%d_%H:%M:%S)_-_DIRECTORY $1 DO NOT EXIST. SKIPPING..."
                shift
                continue
            fi

            # compress the file
            tar czf $DESTINATION/log_archive_$(date +%Y%m%d)_$(date +%H%M%S).tar.gz -C $(dirname $1) $(basename $1) 2>1 /dev/null
            EXIT_STATUS=$?

            case "$EXIT_STATUS" in
                0) echo "$(date +%Y-%m-%d_%H:%M:%S)_-_$1 HAVE BEEN ARCHIVED. CONTINUING..." ;; # Successfull
                1) echo "$(date +%Y-%m-%d_%H:%M:%S)_-_COULD NOT ARCHIVE $1. SOME FILES MAY HAVE CHANGED WHILE BEING ARCHIVED" ;; # Error
                2) echo "$(date +%Y-%m-%d_%H:%M:%S)_-_COULD NOT ARCHIVE $1. EITHER THE DIRECTORY DO NOT EXIST | PERMISSION DENIED | DISK FULL" ;; # Error
            esac

            shift ;;
    esac
            

done

# name of archive : log_archive_YYYYMMDD_TTMMSS
