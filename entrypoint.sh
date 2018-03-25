# !/bin/bash

SS_CONFIG=${SS_CONFIG:-""}
SS_MODULE=${SS_MODULE:-"ss-server"}
OBFS_CONFIG=${OBFS_CONFIG:-""}
OBFS_MODULE=${OBFS_MODULE:-"obfs-server"}
KCP_CONFIG=${KCP_CONFIG:-""}
KCP_MODULE=${KCP_MODULE:-"kcpserver"}

while getopts "s:o:k" OPT; do
    case $OPT in
        s)
            SS_CONFIG=$OPTARG;;
        o)
            OBFS_CONFIG=$OPTARG;;
        k)
            KCP_CONFIG=$OPTARG;;
    esac
done

if [ "$SS_CONFIG" != "" ]; then
    $SS_MODULE $SS_CONFIG
fi
