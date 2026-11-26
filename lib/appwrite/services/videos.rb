# frozen_string_literal: true

module Appwrite
    class Videos < Service
        def initialize(client)
            @client = client
        end

        # Get a list of videos in the current project. Sessions receive only videos
        # they can read according to each video&#039;s `$permissions`. API keys and admins
        # receive the full project catalog. Playback uses the same document read ACL
        # plus the `videos.play` (or `videos.read`) scope: a guest can stream a video
        # that grants `read(&quot;any&quot;)` or `read(&quot;guests&quot;)` even though guests lack
        # `videos.read` and will not see it in this list.
        #
        #
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: bucketId, fileId, name, size, format, duration, width, height, videoCodec, videoBitRate, audioCodec, audioBitRate, search
        # @param [] total When set to false, the total count returned will be 0 and will not be calculated.
        #
        # @return [VideoList]
        def list(
            queries: nil,
            total: nil
        )
            api_path = '/videos'

            api_params = {
                queries: queries,
                total: total,
            }

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "accept": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::VideoList
            )
        end

        # Create a video resource from an existing file in a storage bucket. The
        # source file must be a video or audio file, and the caller must be able to
        # read that file. Creating a video stores the document and queues timeline
        # generation. The worker downloads the source, probes metadata, extracts
        # embedded captions once, and deletes its working copy when finished. Sources
        # with a video track also get a thumbnail timeline. Call create-rendition to
        # package a streaming output.
        #
        # An optional `name` defaults to the source file name. An optional
        # `permissions` array sets the video document ACL (list, get, update, delete,
        # manage child resources, and playback). By default, only the current user is
        # granted all permissions; API keys and admins create with empty permissions
        # when omitted. Guests with `videos.play` can stream when the video grants
        # them read (`read(&quot;any&quot;)` or `read(&quot;guests&quot;)`).
        #
        # Uploaded caption files stay listed alongside auto-extracted tracks for the
        # same language; when the current default is an auto-extracted track with
        # that code, the upload takes the default flag.
        #
        #
        # @param [String] video_id Video ID. Choose a custom ID or generate a random ID with `ID.unique()`. Valid chars are a-z, A-Z, 0-9, period, hyphen, and underscore. Can&#039;t start with a special char. Max length is 36 chars.
        # @param [String] bucket_id Storage bucket unique ID holding the source file.
        # @param [String] file_id Source file unique ID.
        # @param [String] name Video name. Defaults to the source file name. Max length: 2048 chars.
        # @param [Array] permissions An array of permission strings. By default, only the current user is granted all permissions. [Learn more about permissions](https://appwrite.io/docs/permissions).
        #
        # @return [Video]
        def create(
            video_id:,
            bucket_id:,
            file_id:,
            name: nil,
            permissions: nil
        )
            if video_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "videoId"')
            end

            if bucket_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "bucketId"')
            end

            if file_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "fileId"')
            end

            api_path = '/videos'

            api_params = {
                videoId: video_id,
                bucketId: bucket_id,
                fileId: file_id,
                name: name,
                permissions: permissions,
            }

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
                "accept": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Video
            )
        end

        # Get a list of video encode codecs enabled on this instance. Each codec
        # includes the output formats it may be packaged into.
        #
        #
        #
        # @return [VideoCodecList]
        def list_codecs()
            api_path = '/videos/codecs'

            api_params = {}

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "accept": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::VideoCodecList
            )
        end

        # Get a video by its unique ID. This endpoint response returns a JSON object
        # with the video metadata.
        #
        #
        # @param [String] video_id Video unique ID.
        #
        # @return [Video]
        def get(
            video_id:
        )
            if video_id.nil? || video_id == ''
                raise Appwrite::Exception.new('Missing required parameter: "videoId"')
            end

            api_path = '/videos/{videoId}'
                .gsub('{videoId}', @client.encode_path(video_id))

            api_params = {}

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "accept": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Video
            )
        end

        # Update a video&#039;s name, permissions, or both. Only the fields you pass are
        # changed: omit `name` to keep the current name and `permissions` to keep the
        # current ACL. The caller must hold update permission on the video document.
        # The source file cannot be replaced; delete the video and create a new one
        # to point at a different file.
        #
        #
        # @param [String] video_id Video unique ID.
        # @param [String] name Video name. Max length: 2048 chars.
        # @param [Array] permissions An array of permission strings. By default, the current permissions are inherited. [Learn more about permissions](https://appwrite.io/docs/permissions).
        #
        # @return [Video]
        def update(
            video_id:,
            name: nil,
            permissions: nil
        )
            if video_id.nil? || video_id == ''
                raise Appwrite::Exception.new('Missing required parameter: "videoId"')
            end

            api_path = '/videos/{videoId}'
                .gsub('{videoId}', @client.encode_path(video_id))

            api_params = {
                name: name,
                permissions: permissions,
            }

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
                "accept": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::Video
            )
        end

        # Delete a video by its unique ID. This also removes every rendition,
        # caption, preview and transcoded artifact derived from it. Fails with
        # `video_rendition_in_progress` while a rendition is started or ended, unless
        # that rendition has not been updated within the rendition retention window.
        # Fails with `video_timeline_in_progress` while the video&#039;s timeline is being
        # generated, unless the video has not been updated within the same window.
        #
        #
        # @param [String] video_id Video unique ID.
        #
        # @return []
        def delete(
            video_id:
        )
            if video_id.nil? || video_id == ''
                raise Appwrite::Exception.new('Missing required parameter: "videoId"')
            end

            api_path = '/videos/{videoId}'
                .gsub('{videoId}', @client.encode_path(video_id))

            api_params = {}

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
                "accept": 'application/json',
            }

            @client.call(
                method: 'DELETE',
                path: api_path,
                headers: api_headers,
                params: api_params,
            )
        end

        # Get a list of all the caption tracks attached to a video. You can use the
        # query params to filter your results.
        #
        #
        # @param [String] video_id Video unique ID.
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: name, language, default, status, size, bucketId, fileId
        # @param [] total When set to false, the total count returned will be 0 and will not be calculated.
        #
        # @return [VideoCaptionList]
        def list_captions(
            video_id:,
            queries: nil,
            total: nil
        )
            if video_id.nil? || video_id == ''
                raise Appwrite::Exception.new('Missing required parameter: "videoId"')
            end

            api_path = '/videos/{videoId}/captions'
                .gsub('{videoId}', @client.encode_path(video_id))

            api_params = {
                queries: queries,
                total: total,
            }

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "accept": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::VideoCaptionList
            )
        end

        # Add a caption track to a video from a WebVTT or SubRip file in a storage
        # bucket. The file is normalised to WebVTT and segmented in the background.
        # Subscribe to `videos.[videoId].captions.[captionId].update` for `started`,
        # `ready`, and `error` status changes instead of only polling the caption
        # document.
        #
        # Uploaded tracks are listed alongside auto-extracted embedded tracks
        # (`embedded: true`). When the current default is an auto-extracted track for
        # the same language code, the upload takes the default flag so players pick
        # the authored file first. Auto-extracted tracks are never removed
        # automatically — delete a track explicitly to remove it. Extraction runs
        # once per video, so a deleted extracted track is not re-created.
        #
        #
        # @param [String] video_id Video unique ID.
        # @param [String] bucket_id Storage bucket unique ID holding the caption file.
        # @param [String] file_id Caption file unique ID.
        # @param [String] name Caption display name. Allowed characters: a-z, A-Z, 0-9, space, and - . , ( ) _ &#039;
        # @param [String] language Caption ISO 639-2 three-letter language code.
        # @param [] default Make this the default caption track for the video.
        #
        # @return [VideoCaption]
        def create_caption(
            video_id:,
            bucket_id:,
            file_id:,
            name:,
            language:,
            default: nil
        )
            if video_id.nil? || video_id == ''
                raise Appwrite::Exception.new('Missing required parameter: "videoId"')
            end

            if bucket_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "bucketId"')
            end

            if file_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "fileId"')
            end

            if name.nil?
                raise Appwrite::Exception.new('Missing required parameter: "name"')
            end

            if language.nil?
                raise Appwrite::Exception.new('Missing required parameter: "language"')
            end

            api_path = '/videos/{videoId}/captions'
                .gsub('{videoId}', @client.encode_path(video_id))

            api_params = {
                bucketId: bucket_id,
                fileId: file_id,
                name: name,
                language: language,
                default: default,
            }

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
                "accept": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::VideoCaption
            )
        end

        # Update a caption track by its unique ID. Pass only `name`, `language`,
        # and/or `default` to retag an extracted track (for example `und` → `heb`
        # for Hebrew) without replacing the file. Changing `bucketId`/`fileId`
        # re-packages the track in the background.
        #
        #
        # @param [String] video_id Video unique ID.
        # @param [String] caption_id Caption unique ID.
        # @param [String] bucket_id Storage bucket unique ID holding the caption file. Omit together with fileId to only update name, language, or default.
        # @param [String] file_id Caption file unique ID. Omit together with bucketId to only update name, language, or default.
        # @param [String] name Caption display name. Allowed characters: a-z, A-Z, 0-9, space, and - . , ( ) _ &#039;
        # @param [String] language Caption ISO 639-2 three-letter language code (for example `heb` for Hebrew).
        # @param [] default Make this the default caption track for the video. Omit to leave unchanged.
        #
        # @return [VideoCaption]
        def update_caption(
            video_id:,
            caption_id:,
            bucket_id: nil,
            file_id: nil,
            name: nil,
            language: nil,
            default: nil
        )
            if video_id.nil? || video_id == ''
                raise Appwrite::Exception.new('Missing required parameter: "videoId"')
            end

            if caption_id.nil? || caption_id == ''
                raise Appwrite::Exception.new('Missing required parameter: "captionId"')
            end

            api_path = '/videos/{videoId}/captions/{captionId}'
                .gsub('{videoId}', @client.encode_path(video_id))
                .gsub('{captionId}', @client.encode_path(caption_id))

            api_params = {
                bucketId: bucket_id,
                fileId: file_id,
                name: name,
                language: language,
                default: default,
            }

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
                "accept": 'application/json',
            }

            @client.call(
                method: 'PATCH',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::VideoCaption
            )
        end

        # Delete a caption track by its unique ID, along with its packaged segments.
        #
        #
        # @param [String] video_id Video unique ID.
        # @param [String] caption_id Caption unique ID.
        #
        # @return []
        def delete_caption(
            video_id:,
            caption_id:
        )
            if video_id.nil? || video_id == ''
                raise Appwrite::Exception.new('Missing required parameter: "videoId"')
            end

            if caption_id.nil? || caption_id == ''
                raise Appwrite::Exception.new('Missing required parameter: "captionId"')
            end

            api_path = '/videos/{videoId}/captions/{captionId}'
                .gsub('{videoId}', @client.encode_path(video_id))
                .gsub('{captionId}', @client.encode_path(caption_id))

            api_params = {}

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
                "accept": 'application/json',
            }

            @client.call(
                method: 'DELETE',
                path: api_path,
                headers: api_headers,
                params: api_params,
            )
        end

        # Get the top-level streaming manifest for a video output: an HLS master
        # playlist (`master.m3u8`) or a DASH MPD (`master.mpd`). Hand this URL to a
        # player to begin adaptive playback.
        #
        # Guests can request this URL when they hold `videos.play` (or `videos.read`)
        # **and** the video document grants them read. A video with `read(&quot;any&quot;)` or
        # `read(&quot;guests&quot;)` is playable without a session.
        #
        # For CMAF renditions, use `getCmafHlsManifest` or `getCmafDashManifest`.
        # Both masters point at the same fMP4 segment set.
        #
        #
        # @param [String] video_id Video unique ID.
        #
        # @return []
        def get_cmaf_hls_manifest(
            video_id:
        )
            if video_id.nil? || video_id == ''
                raise Appwrite::Exception.new('Missing required parameter: "videoId"')
            end

            api_path = '/videos/{videoId}/outputs/cmaf/master.m3u8'
                .gsub('{videoId}', @client.encode_path(video_id))

            api_params = {}

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "accept": '*/*',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
            )
        end

        # Get the top-level streaming manifest for a video output: an HLS master
        # playlist (`master.m3u8`) or a DASH MPD (`master.mpd`). Hand this URL to a
        # player to begin adaptive playback.
        #
        # Guests can request this URL when they hold `videos.play` (or `videos.read`)
        # **and** the video document grants them read. A video with `read(&quot;any&quot;)` or
        # `read(&quot;guests&quot;)` is playable without a session.
        #
        # For CMAF renditions, use `getCmafHlsManifest` or `getCmafDashManifest`.
        # Both masters point at the same fMP4 segment set.
        #
        #
        # @param [String] video_id Video unique ID.
        #
        # @return []
        def get_cmaf_dash_manifest(
            video_id:
        )
            if video_id.nil? || video_id == ''
                raise Appwrite::Exception.new('Missing required parameter: "videoId"')
            end

            api_path = '/videos/{videoId}/outputs/cmaf/master.mpd'
                .gsub('{videoId}', @client.encode_path(video_id))

            api_params = {}

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "accept": '*/*',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
            )
        end

        # Get the top-level streaming manifest for a video output: an HLS master
        # playlist (`master.m3u8`) or a DASH MPD (`master.mpd`). Hand this URL to a
        # player to begin adaptive playback.
        #
        # Guests can request this URL when they hold `videos.play` (or `videos.read`)
        # **and** the video document grants them read. A video with `read(&quot;any&quot;)` or
        # `read(&quot;guests&quot;)` is playable without a session.
        #
        # For CMAF renditions, use `getCmafHlsManifest` or `getCmafDashManifest`.
        # Both masters point at the same fMP4 segment set.
        #
        #
        # @param [String] video_id Video unique ID.
        #
        # @return []
        def get_dash_manifest(
            video_id:
        )
            if video_id.nil? || video_id == ''
                raise Appwrite::Exception.new('Missing required parameter: "videoId"')
            end

            api_path = '/videos/{videoId}/outputs/dash/master.mpd'
                .gsub('{videoId}', @client.encode_path(video_id))

            api_params = {}

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "accept": '*/*',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
            )
        end

        # Get the top-level streaming manifest for a video output: an HLS master
        # playlist (`master.m3u8`) or a DASH MPD (`master.mpd`). Hand this URL to a
        # player to begin adaptive playback.
        #
        # Guests can request this URL when they hold `videos.play` (or `videos.read`)
        # **and** the video document grants them read. A video with `read(&quot;any&quot;)` or
        # `read(&quot;guests&quot;)` is playable without a session.
        #
        # For CMAF renditions, use `getCmafHlsManifest` or `getCmafDashManifest`.
        # Both masters point at the same fMP4 segment set.
        #
        #
        # @param [String] video_id Video unique ID.
        #
        # @return []
        def get_hls_manifest(
            video_id:
        )
            if video_id.nil? || video_id == ''
                raise Appwrite::Exception.new('Missing required parameter: "videoId"')
            end

            api_path = '/videos/{videoId}/outputs/hls/master.m3u8'
                .gsub('{videoId}', @client.encode_path(video_id))

            api_params = {}

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "accept": '*/*',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
            )
        end

        # Get the playable caption resource for a video output: an HLS captions
        # playlist, or the WebVTT file itself for DASH.
        #
        # Guests can request this URL when they hold `videos.play` (or `videos.read`)
        # **and** the video document grants them read.
        #
        #
        # @param [String] video_id Video unique ID.
        # @param [VideoOutput] output Streaming output format.
        # @param [String] caption_id Caption unique ID.
        #
        # @return []
        def get_caption_manifest(
            video_id:,
            output:,
            caption_id:
        )
            if video_id.nil? || video_id == ''
                raise Appwrite::Exception.new('Missing required parameter: "videoId"')
            end

            if output.nil?
                raise Appwrite::Exception.new('Missing required parameter: "output"')
            end

            if caption_id.nil? || caption_id == ''
                raise Appwrite::Exception.new('Missing required parameter: "captionId"')
            end

            api_path = '/videos/{videoId}/outputs/{output}/captions/{captionId}/manifest'
                .gsub('{videoId}', @client.encode_path(video_id))
                .gsub('{output}', @client.encode_path(output))
                .gsub('{captionId}', @client.encode_path(caption_id))

            api_params = {}

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "accept": '*/*',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
            )
        end

        # Get a list of all the renditions of a video. You can use the query params
        # to filter your results.
        #
        #
        # @param [String] video_id Video unique ID.
        # @param [Array] queries Array of query strings generated using the Query class provided by the SDK. [Learn more about queries](https://appwrite.io/docs/queries). Maximum of 100 queries are allowed, each 4096 characters long. You may filter on the following attributes: profileId, name, status, output, codec, width, height, videoBitRate, audioBitRate, size, startedAt, endedAt
        # @param [] total When set to false, the total count returned will be 0 and will not be calculated.
        #
        # @return [VideoRenditionList]
        def list_renditions(
            video_id:,
            queries: nil,
            total: nil
        )
            if video_id.nil? || video_id == ''
                raise Appwrite::Exception.new('Missing required parameter: "videoId"')
            end

            api_path = '/videos/{videoId}/renditions'
                .gsub('{videoId}', @client.encode_path(video_id))

            api_params = {
                queries: queries,
                total: total,
            }

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "accept": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::VideoRenditionList
            )
        end

        # Request a new rendition of a video, encoded against a video profile and
        # packaged for HLS, DASH, or CMAF. The rendition is created immediately with
        # a `pending` status and transcoded in the background; poll it or subscribe
        # to realtime events to follow its progress. The worker downloads the source
        # file for this job, probes metadata and extracts embedded captions when
        # needed, then deletes the working copy when the job ends.
        #
        # The profile codec must be enabled on this instance. A disabled codec fails
        # with `video_codec_disabled`.
        #
        # Each video may have only one rendition per profile and output combination.
        # Creating a duplicate fails with `video_rendition_already_exists`. After an
        # encode fails or is aborted, delete the rendition and create it again. The
        # same profile may still be encoded for different outputs (for example HLS
        # and DASH).
        #
        # A video accepts 10 rendition creates per hour. The next create returns
        # `general_rate_limit_exceeded`.
        #
        # CMAF packs shared fMP4 segments once and exposes both HLS
        # (`/outputs/cmaf/master.m3u8`) and DASH (`/outputs/cmaf/master.mpd`) masters
        # for the same encode.
        #
        # Renditions can only be created from the Console or a server SDK with an API
        # key that has the `videos.write` scope. Each encode spends the project&#039;s
        # compute, so client sessions receive `user_unauthorized`.
        #
        #
        # @param [String] video_id Video unique ID.
        # @param [String] profile_id Video profile unique ID to encode against.
        # @param [VideoOutput] output Streaming output format to package as.
        #
        # @return [VideoRendition]
        def create_rendition(
            video_id:,
            profile_id:,
            output:
        )
            if video_id.nil? || video_id == ''
                raise Appwrite::Exception.new('Missing required parameter: "videoId"')
            end

            if profile_id.nil?
                raise Appwrite::Exception.new('Missing required parameter: "profileId"')
            end

            if output.nil?
                raise Appwrite::Exception.new('Missing required parameter: "output"')
            end

            api_path = '/videos/{videoId}/renditions'
                .gsub('{videoId}', @client.encode_path(video_id))

            api_params = {
                profileId: profile_id,
                output: output,
            }

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
                "accept": 'application/json',
            }

            @client.call(
                method: 'POST',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::VideoRendition
            )
        end

        # Get a rendition by its unique ID, including its current transcoding status
        # and progress.
        #
        #
        # @param [String] video_id Video unique ID.
        # @param [String] rendition_id Rendition unique ID.
        #
        # @return [VideoRendition]
        def get_rendition(
            video_id:,
            rendition_id:
        )
            if video_id.nil? || video_id == ''
                raise Appwrite::Exception.new('Missing required parameter: "videoId"')
            end

            if rendition_id.nil? || rendition_id == ''
                raise Appwrite::Exception.new('Missing required parameter: "renditionId"')
            end

            api_path = '/videos/{videoId}/renditions/{renditionId}'
                .gsub('{videoId}', @client.encode_path(video_id))
                .gsub('{renditionId}', @client.encode_path(rendition_id))

            api_params = {}

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "accept": 'application/json',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
                response_type: Models::VideoRendition
            )
        end

        # Delete a rendition by its unique ID, along with its packaged segments and
        # transcoded output. Fails with `video_rendition_in_progress` while the
        # rendition is started or ended, unless it has not been updated within the
        # rendition retention window.
        #
        #
        # @param [String] video_id Video unique ID.
        # @param [String] rendition_id Rendition unique ID.
        #
        # @return []
        def delete_rendition(
            video_id:,
            rendition_id:
        )
            if video_id.nil? || video_id == ''
                raise Appwrite::Exception.new('Missing required parameter: "videoId"')
            end

            if rendition_id.nil? || rendition_id == ''
                raise Appwrite::Exception.new('Missing required parameter: "renditionId"')
            end

            api_path = '/videos/{videoId}/renditions/{renditionId}'
                .gsub('{videoId}', @client.encode_path(video_id))
                .gsub('{renditionId}', @client.encode_path(rendition_id))

            api_params = {}

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "content-type": 'application/json',
                "accept": 'application/json',
            }

            @client.call(
                method: 'DELETE',
                path: api_path,
                headers: api_headers,
                params: api_params,
            )
        end

        # Get a single thumbnail sheet from a video&#039;s timeline as an image. You can
        # resize the returned image and choose its output format.
        #
        # Guests can request this URL when they hold `videos.play` (or `videos.read`)
        # **and** the video document grants them read.
        #
        #
        # @param [String] video_id Video unique ID.
        # @param [String] thumbnail_id Thumbnail unique ID.
        # @param [Integer] width Resize thumbnail image width, in pixels.
        # @param [Integer] height Resize thumbnail image height, in pixels.
        # @param [ImageFormat] output Output format type (jpeg, jpg, png, gif and webp).
        #
        # @return []
        def get_thumbnail(
            video_id:,
            thumbnail_id:,
            width: nil,
            height: nil,
            output: nil
        )
            if video_id.nil? || video_id == ''
                raise Appwrite::Exception.new('Missing required parameter: "videoId"')
            end

            if thumbnail_id.nil? || thumbnail_id == ''
                raise Appwrite::Exception.new('Missing required parameter: "thumbnailId"')
            end

            api_path = '/videos/{videoId}/thumbnails/{thumbnailId}'
                .gsub('{videoId}', @client.encode_path(video_id))
                .gsub('{thumbnailId}', @client.encode_path(thumbnail_id))

            api_params = {
                width: width,
                height: height,
                output: output,
            }

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "accept": 'image/*',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
            )
        end

        # Get the WebVTT thumbnail timeline for a video, used to render scrubbing
        # thumbnails in a player. Timeline generation is queued when the video is
        # created. Subscribe to `videos.[videoId].timelines.update` for probe and
        # terminal updates, or poll this endpoint until it returns a WebVTT document.
        # Audio-only sources produce no timeline and this endpoint returns
        # `video_timelines_not_found`.
        #
        # Guests can request this URL when they hold `videos.play` (or `videos.read`)
        # **and** the video document grants them read. A video with `read(&quot;any&quot;)` or
        # `read(&quot;guests&quot;)` is playable without a session.
        #
        #
        # @param [String] video_id Video unique ID.
        #
        # @return []
        def get_timeline(
            video_id:
        )
            if video_id.nil? || video_id == ''
                raise Appwrite::Exception.new('Missing required parameter: "videoId"')
            end

            api_path = '/videos/{videoId}/timeline'
                .gsub('{videoId}', @client.encode_path(video_id))

            api_params = {}

            api_headers = {
                "X-Appwrite-Project": @client.get_config('project'),
                "accept": '*/*',
            }

            @client.call(
                method: 'GET',
                path: api_path,
                headers: api_headers,
                params: api_params,
            )
        end
    end
end
