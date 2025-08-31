dry="0"

log() {
    if [[ "$dry" == "1" ]]; then
        echo "[DRY_RUN]: $@"
    else
        echo "$@"
    fi
}

execute () {
    log "execute $@"
    if [[ $dry == "1" ]]; then
        return
    fi
    "$@"
}

copy_dir() {
    pushd "$1"
    to="$2"
    dirs=$(find . -maxdepth 1 -mindepth 1 -type d)
    for dir in $dirs; do
        execute rm -rf "$to/$dir"
        execute cp -r "$dir" "$to/$dir"
    done
    popd
}

copy_file() {
    from="$1"
    to="$2"
    name=$(basename "$from")
    execute rm "$to/$name"
    execute cp "$from" "$to/$name"
}
