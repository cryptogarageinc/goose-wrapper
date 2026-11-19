#!/bin/sh

if [ -z "$1" ]; then
  echo "Usage: $0 <version>"
  exit 1
fi

VERSION=$1

mkdir -p dist

# linux/amd64
GOOS=linux GOARCH=amd64 go build -o dist/goose-linux-amd64 -ldflags="-s -w -X main.version=${VERSION}" ./cmd/goose
tar czf dist/goose-${VERSION}-linux-amd64.tar.gz -C dist goose-linux-amd64

# linux/arm64
GOOS=linux GOARCH=arm64 go build -o dist/goose-linux-arm64 -ldflags="-s -w -X main.version=${VERSION}" ./cmd/goose
tar czf dist/goose-${VERSION}-linux-arm64.tar.gz -C dist goose-linux-arm64

# darwin/amd64
GOOS=darwin GOARCH=amd64 go build -o dist/goose-darwin-amd64 -ldflags="-s -w -X main.version=${VERSION}" ./cmd/goose
tar czf dist/goose-${VERSION}-darwin-amd64.tar.gz -C dist goose-darwin-amd64

# darwin/arm64
GOOS=darwin GOARCH=arm64 go build -o dist/goose-darwin-arm64 -ldflags="-s -w -X main.version=${VERSION}" ./cmd/goose
tar czf dist/goose-${VERSION}-darwin-arm64.tar.gz -C dist goose-darwin-arm64

# windows/amd64
GOOS=windows GOARCH=amd64 go build -o dist/goose-windows-amd64.exe -ldflags="-s -w -X main.version=${VERSION}" ./cmd/goose
zip -j dist/goose-${VERSION}-windows-amd64.zip dist/goose-windows-amd64.exe

# windows/arm64
GOOS=windows GOARCH=arm64 go build -o dist/goose-windows-arm64.exe -ldflags="-s -w -X main.version=${VERSION}" ./cmd/goose
zip -j dist/goose-${VERSION}-windows-arm64.zip dist/goose-windows-arm64.exe

# checksum
cd dist
sha256sum *.tar.gz *.zip > checksums.txt
cd ..

echo "Build and packaging complete. Checksums generated in dist/checksums.txt"
