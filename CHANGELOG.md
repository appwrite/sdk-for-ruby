# Change Log

## 23.0.0

* [BREAKING] Renamed Webhook model fields: `security` → `tls`, `httpUser` → `authUsername`, `httpPass` → `authPassword`, `signatureKey` → `secret`
* [BREAKING] Renamed Webhook service parameters to match: `security` → `tls`, `httpUser` → `authUsername`, `httpPass` → `authPassword`
* [BREAKING] Renamed `Webhooks#update_signature` to `Webhooks#update_secret` with new optional `secret` parameter
* Added `Client#get_headers` method to retrieve request headers
* Added `secret` parameter to Webhook create and update methods
* Added `x` OAuth provider to `OAuthProvider` enum
* Added `userType` field to `Log` model
* Added `purge` parameter to `update_collection` and `update_table` for cache invalidation
* Added Project service: platform CRUD, key CRUD, protocol/service status management
* Added new models: `Key`, `KeyList`, `Project`, `DevKey`, `MockNumber`, `AuthProvider`, `PlatformAndroid`, `PlatformApple`, `PlatformLinux`, `PlatformList`, `PlatformWeb`, `PlatformWindows`, `BillingLimits`, `Block`
* Added new enums: `PlatformType`, `ProtocolId`, `ServiceId`
* Updated `BuildRuntime`, `Runtime` enums with `dart-3.11` and `flutter-3.41`
* Updated `Scopes` enum with `keys_read`, `keys_write`, `platforms_read`, `platforms_write`
* Updated `X-Appwrite-Response-Format` header to `1.9.1`
* Updated TTL description for list caching in Databases and TablesDB

## 22.0.0

* [BREAKING] Changed `$sequence` type from `int` to `string` for rows and documents
* [BREAKING] Renamed `IndexType` enum: split into `DatabasesIndexType` (for Databases) and `TablesDBIndexType` (for TablesDB)
* [BREAKING] Replaced `specification` parameter with `build_specification` and `runtime_specification` in `Functions#create`, `Functions#update`, `Sites#create`, `Sites#update`
* Added new `Project` service with full CRUD for project-level environment variables
* Added new `Webhooks` service with full CRUD for project webhooks (including `update_signature`)
* Added `Webhook` and `WebhookList` models
* Added `Users#update_impersonator` method for enabling/disabling user impersonation
* Added impersonation support: `set_impersonate_user_id`, `set_impersonate_user_email`, `set_impersonate_user_phone` on `Client`
* Added `impersonator` and `impersonator_user_id` fields to `User` model
* Added `deployment_retention` parameter to Functions and Sites create/update
* Added `start_command` parameter to Sites create/update
* Added `Documentsdb`, `Vectorsdb` values to `BackupServices` and `DatabaseType` enums
* Added `WebhooksRead`, `WebhooksWrite`, `ProjectRead`, `ProjectWrite` scopes
* Removed `get_queue_billing_project_aggregation`, `get_queue_billing_team_aggregation`, `get_queue_priority_builds`, `get_queue_region_manager`, `get_queue_threats` from `Health` service
* Updated `Log` model field descriptions to clarify impersonation behavior
* Updated `X-Appwrite-Response-Format` header to `1.9.0`
* Updated README badge to API version `1.9.0` and compatibility to server version `1.9.x`

## 21.1.0

* Added get_console_pausing health endpoint to monitor console pausing.
* Added ttl parameter for cached responses in list_documents and list_rows.
* Made activate parameter optional in Sites.create_deployment.
* Updated collection_id doc to reference collection instead of table.
* Added update_relationship_attribute API to update relationship attributes.
* Updated team roles length limit docstrings from 32 to 81 chars.
* Updated subscriber list docs to reflect new query filters.
* Added Ruby example for health get_console_pausing.

## 21.0.1

* Remove obsolete GitHub issue templates (bug.yaml, documentation.yaml, feature.yaml) to simplify repository maintenance.
* Remove CI workflows for auto-closing external PRs (autoclose.yml) and publishing to RubyGems (publish.yml).
* Cleanup of documentation examples: several outdated docs under docs/examples/health, docs/examples/tablesdb, and docs/examples/databases have been deleted.
* Documentation improvements: updated several create_* attribute example blocks to include encrypt: false where applicable (e.g., longtext/mediumtext/text/varchar attribute examples and related columns).
* Note: This release aligns the gemspec/versioning for a patch release (bump to 21.0.1 in a real patch) to reflect these internal maintenance changes.
* Add support for the new `Backups` service

## 21.0.0

* Add array-based enum parameters (e.g., `permissions: Array<BrowserPermission>`).
* Breaking change: `Output` enum has been removed; use `ImageFormat` instead.
* Add `getQueueAudits` support to `Health` service.
* Add longtext/mediumtext/text/varchar attribute and column helpers to `Databases` and `TablesDB` services.

## 20.1.0

* Added ability to create columns and indexes synchronously while creating a table

## 20.0.0

* Rename `VCSDeploymentType` enum to `VCSReferenceType`
* Change `create_template_deployment` method signature: replace `version` parameter with `type` (TemplateReferenceType) and `reference` parameters
* Add `get_screenshot` method to `Avatars` service
* Add `Theme`, `Timezone` and `Output` enums

## 19.3.0

* Add `total` parameter to list queries allowing skipping counting rows in a table for improved performance
* Add `Operator` class for atomic modification of rows via update, bulk update, upsert, and bulk upsert operations
* Add `create_resend_provider` and `update_resend_provider` methods to `Messaging` service

## 19.2.1

* Add transaction support for Databases and TablesDB

## 19.1.0

* Deprecate `createVerification` method in `Account` service
* Add `createEmailVerification` method in `Account` service

## 16.1.0

* Add `incrementDocumentAttribute` and `decrementDocumentAttribute` support to `Databases` service
* Add `dart38` and `flutter332` support to runtime models
* Add `gif` support to `ImageFormat` enum
* Add `encrypt` support to `StringAttribute` model
* Add `sequence` support to `Document` model
* Add `upsertDocument` support to `Databases` service

## 16.0.0

* Add `<REGION>` to doc examples due to the new multi region endpoints
* Add doc examples and methods for bulk api transactions: `createDocuments`, `deleteDocuments` etc.
* Add doc examples, class and methods for new `Sites` service
* Add doc examples, class and methods for new `Tokens` service
* Add enums for `BuildRuntime `, `Adapter`, `Framework`, `DeploymentDownloadType` and `VCSDeploymentType`
* Update enum for `runtimes` with Pythonml312, Dart219, Flutter327 and Flutter329
* Add `token` param to `getFilePreview` and `getFileView` for File tokens usage
* Add `queries` and `search` params to `listMemberships` method
* Remove `search` param from `listExecutions` method

## 15.0.0

* Fix requests failing by removing `Content-Type` header from `GET` and `HEAD` requests

## 14.0.0

* Fix pong response & chunked upload
