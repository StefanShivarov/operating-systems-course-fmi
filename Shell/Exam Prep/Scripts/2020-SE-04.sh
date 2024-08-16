#!/bin/bash

if [[ ${#} -ne 2 ]]; then
        echo "Invalid number of arguments!"
        exit 1
fi

if [[ ! -d ${1} ]]; then
        echo "First argument must be an existing directory!"
        exit 1
fi

SRC=${1}
DEST=${2}

jpgFiles=$(find ${SRC} -mindepth 1 -type f -printf "%P\n" | grep -E '\.jpg$')
while read file; do
        fileName=$(basename "${file}")
        title=$(echo "${fileName}" | sed -E 's/\([^\)]*\)//g' | sed -E 's/( )+/ /g' | sed -E 's/^( )+//' | sed -E 's/( )*.jpg//')
        album=$(echo "${fileName}" | sed -E 's/.*\(([^()]*)\)[^()]*$/\1/')
        [[ ${album} == "${fileName}" ]] && album="misc"
        lastModificationDate=$(date -d $(stat "${file}" -c "%y" | awk '{print $1}') +"%Y-%m-%d")
        shaSum=$(sha256sum "${file}" | awk '{print $1}' | cut -c 1-16)

        mkdir -p "${DEST}/images" && cp "${file}" "${DEST}/images/${shaSum}.jpg"

        mkdir -p "${DEST}/by-date/${lastModificationDate}/by-album/${album}/by-title" && ln -s "${file}" "${DEST}/by-date/${lastModificationDate}/by-album/${album}/by-title/${title}.jpg"

        mkdir -p "${DEST}/by-date/${lastModificationDate}/by-title" && ln -s "${file}" "${DEST}/by-date/${lastModificationDate}/by-title/${title}.jpg"

        mkdir -p "${DEST}/by-album/${album}/by-date/${lastModificationDate}/by-title" && ln -s "${file}" "${DEST}/by-album/${album}/by-date/${lastModificationDate}/by-title/${title}.jpg"

        mkdir -p "${DEST}/by-album/${album}/by-title" && ln -s "${file}" "${DEST}/by-album/${album}/by-title/${title}.jpg"

        mkdir -p "${DEST}/by-title" && ln -s "${file}" "${DEST}/by-title/${title}.jpg"

done < <(find ${SRC} -mindepth 1 -type f | grep -E '\.jpg$' | sort)