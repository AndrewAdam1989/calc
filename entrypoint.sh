#!/bin/bash

SS_CFG=${SS_CFG:-""}
SS_CMD=${SS_CMD:-"ss-server"}
OBFS_CFG=${OBFS_CFG:-""}
OBFS_CMD=${OBFS_CMD:-"obfs-server"}
KCP_CFG=${KCP_CFG:-""}
KCP_CMD=${KCP_CMD:-"kcpserver"}

while getopts "s:S:o:O:k:K" OPT; do
	case $OPT in
		s)
			SS_CFG=$OPTARG;;
		S)
			SS_CMD=$OPTARG;;
		o)
			OBFS_CFG=$OPTARG;;
		O)
			OBFS_CMD=$OPTARG;;
		k)
			KCP_CFG=$OPTARG;;
		K)
			KCP_CMD=$OPTARG;;
	esac
done

if [ "$OBFS_CFG" != "" ]; then
	echo -e "\033[32mStarting simple-obfs......\033[0m"
	$OBFS_CMD $OBFS_CFG 2>&1 &
else
	echo -e "\033[33mSimple-obfs not started......\033[0m"
fi

if [ "$KCP_CFG" != "" ]; then
	echo -e "\033[32mStarting kcptun......\033[0m"
	$KCP_CMD $KCP_CFG 2>&1 &
else
	echo -e "\033[33mKcptun not started......\033[0m"
fi

if [ "$SS_CFG" != "" ]; then
	echo -e "\033[32mStarting shadowsocks......\033[0m"
	$SS_CMD $SS_CFG
else
	echo -e "\033[33mShadowsocks not started......\033[0m"
fi
