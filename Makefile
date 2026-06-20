SHELL := /bin/bash

API_BASE_URL ?= http://10.0.2.2:5000/api
FLUTTER_DEFINE := --dart-define=API_BASE_URL=$(API_BASE_URL)
WORKSPACE_PACKAGES := \
	apps/patient_app \
	apps/provider_app \
	packages/core \
	packages/data \
	packages/localization \
	packages/ui_kit

.PHONY: get clean run-patient run-provider analyze test test-all \
	build-patient-android build-provider-android build-android ci

get:
	flutter pub get --enforce-lockfile

clean:
	@set -euo pipefail; for package in $(WORKSPACE_PACKAGES); do \
		(cd "$$package" && flutter clean); \
	done

run-patient:
	cd apps/patient_app && flutter run $(FLUTTER_DEFINE)

run-provider:
	cd apps/provider_app && flutter run $(FLUTTER_DEFINE)

analyze:
	@set -euo pipefail; for package in $(WORKSPACE_PACKAGES); do \
		echo "Analyzing $$package"; \
		(cd "$$package" && flutter analyze --fatal-infos); \
	done

test: test-all

test-all:
	@set -euo pipefail; for package in $(WORKSPACE_PACKAGES); do \
		if [[ -d "$$package/test" ]] && find "$$package/test" -name '*_test.dart' -print -quit | grep -q .; then \
			echo "Testing $$package"; \
			(cd "$$package" && flutter test); \
		fi; \
	done

build-patient-android:
	cd apps/patient_app && flutter build apk --release $(FLUTTER_DEFINE)

build-provider-android:
	cd apps/provider_app && flutter build apk --release $(FLUTTER_DEFINE)

build-android: build-patient-android build-provider-android

ci: get analyze test-all build-android
