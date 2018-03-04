# !/bin/bash

SS_CONFIG=${SS_CONFIG:-""}
SS_MODULE=${SS_MODULE:-"ss-server"}
OBFS_CONFIG=${OBFS_CONFIG:-""}
OBFS_MODULE=${OBFS_MODULE:-"obfs-server"}
KCP_CONFIG=${KCP_CONFIG:-""}
KCP_MODULE=${KCP_MODULE:-"kcpserver"}

while getopts "s:sm:o:om:k:km" OPT; do
    case $OPT in
        s)
            SS_CONFIG=$OPTARG;;
        sm)
            SS_MODULE=$OPTARG;;
        o)
            OBFS_CONFIG=$OPTARG;;
        om)
            OBFS_MODULE=$OPTARG;;
        k)
            KCP_CONFIG=$OPTARG;;
        km)
            KCP_MODULE=$OPTARG;;
    esac
done

if [ "$SS_CONFIG" != "" ]; then
    $SS_MODULE $SS_CONFIG 2>&1 &
fi

if [ "$OBFS_CONFIG" != "" ]; then
    $OBFS_MODULE $OBFS_CONFIG 2>&1 &
fi

if [ "$KCP_CONFIG" != "" ]; then
    $KCP_MODULE $KCP_CONFIG 2>&1 &
fi
