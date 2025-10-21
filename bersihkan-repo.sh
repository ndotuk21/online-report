#!/bin/bash

# === Konfigurasi ===
REPO_URL="https://github.com/ndotuk21/online-report.git"
BRANCH="main"

# === Jalankan ===
echo ">> Clone repo..."
git clone $REPO_URL temp-repo
cd temp-repo || exit

echo ">> Checkout ke branch $BRANCH..."
git checkout $BRANCH 2>/dev/null || git checkout -b $BRANCH

echo ">> Hapus semua file..."
git rm -r * .[^.]* 2>/dev/null

echo ">> Commit perubahan..."
git commit -m "Hapus semua file di repository"

echo ">> Push ke GitHub..."
git push origin $BRANCH

echo ">> Bersih! Semua file sudah dihapus dari repository."

# (Opsional) Hapus folder sementara
cd ..
rm -rf temp-repo
