#!/usr/bin/env bash
# Build e instalacao do Movie App (atv4) no iPhone, contornando o flutter run
# (que depende do simctl). Usar APOS reiniciar o Mac.
#
# Uso:
#   cd 2BIM/atv4 && bash deploy_iphone.sh
#
# Dados do ambiente (descobertos em 2026-05-30):
DEVICE_ID="00008020-000C6DDE0113802E"   # iPhone XR (raasclaat)
BUNDLE_ID="com.bryancharles.movies"
APP_PATH="build/ios/iphoneos/Runner.app"

set -e

echo "==> 1/3 Build iOS release..."
flutter build ios --release

echo "==> 2/3 Instalando no iPhone via devicectl..."
xcrun devicectl device install app --device "$DEVICE_ID" "$APP_PATH"

echo "==> 3/3 Abrindo o app no iPhone..."
xcrun devicectl device process launch --device "$DEVICE_ID" "$BUNDLE_ID"

echo "==> Concluido. O app deve estar aberto no iPhone."
echo "    (Alternativa mais simples, se o simctl estiver ok: flutter run --release -d $DEVICE_ID)"
