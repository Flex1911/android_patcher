#!/bin/bash

ROOT="${PWD}"
REPOSITORIES=(
    'bionic'
    'bootable/recovery'
    'build/make'
    'build/soong'
    'external/selinux'
    'frameworks/base'
    'frameworks/native'
    'frameworks/opt/telephony'
    'packages/apps/Camera2'
    'system/core'
    'system/sepolicy'
)

for repository in "${REPOSITORIES[@]}"; do
    cd "${ROOT}/${repository}"

    git am --keep-cr "${ROOT}/patcher/patches/${repository}"/*

    cd "${ROOT}"
done
