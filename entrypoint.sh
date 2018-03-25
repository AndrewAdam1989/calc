#!/bin/bash

SS_CONFIG=${SS_CONFIG:-""}
SS_MODULE=${SS_MODULE:-"ss-server"}
OBFS_CONFIG=${OBFS_CONFIG:-""}
OBFS_MODULE=${OBFS_MODULE:-"obfs-server"}
KCP_CONFIG=${KCP_CONFIG:-""}
KCP_MODULE=${KCP_MODULE:-"kcpserver"}

while getopts "s:S:o:O:k:K" OPT; do
	case $OPT in
		s)
			SS_CONFIG=$OPTARG;;
		S)
			SS_MODULE=$OPTARG;;
		o)
			OBFS_CONFIG=$OPTARG;;
		O)
			OBFS_MODULE=$OPTARG;;
		k)
			KCP_CONFIG=$OPTARG;;
		K)
			KCP_MODULE=$OPTARG;;
	esac
done

if [ "$OBFS_CONFIG" != "" ]; then
	echo -e "\033[32mStarting simple-obfs......\033[0m"
	$OBFS_MODULE $OBFS_CONFIG 2>&1 &
else
	echo -e "\033[33mSimple-obfs not started......\033[0m"
fi

if [ "$KCP_CONFIG" != "" ]; then
	echo -e "\033[32mStarting kcptun......\033[0m"
	$KCP_MODULE $KCP_CONFIG 2>&1 &
else
	echo -e "\033[33mKcptun not started......\033[0m"
fi

if [ "$SS_CONFIG" != "" ]; then
	echo -e "\033[32mStarting shadowsocks......\033[0m"
	$SS_MODULE $SS_CONFIG 2>&1 &
else
	echo -e "\033[33mShadowsocks not started......\033[0m"
fi
