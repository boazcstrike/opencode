# Video Converter Skill

## Description
This skill provides workflows and instructions for converting video and audio files between different formats using FFmpeg. It handles common conversion tasks like webm to wav, mp4 to avi, extracting audio from video, and more.

## When to Use
- Converting audio files for TTS (Text-to-Speech) preparation
- Changing video formats for compatibility with different devices or software
- Extracting audio tracks from video files
- Compressing or resizing video files
- Any media format conversion task

## Prerequisites
- Node.js installed (for ffmpeg-static package)
- Access to the file system for input/output files

## Workflow

### 1. Install FFmpeg
If FFmpeg is not available globally, install the ffmpeg-static package:
```bash
npm install ffmpeg-static
```

### 2. Locate FFmpeg Binary
Get the path to the FFmpeg executable:
```bash
node -e "console.log(require('ffmpeg-static'))"
```

### 3. Convert Files
Use the FFmpeg command with appropriate options:
- Basic conversion: `ffmpeg -i input.ext output.ext`
- Audio extraction: `ffmpeg -i video.mp4 -vn audio.wav`
- Specific codec: `ffmpeg -i input.webm -acodec pcm_s16le output.wav`

### 4. Verify Output
Check that the output file was created and has the expected size/duration.

## Common Conversions
- WebM to WAV: `ffmpeg -i input.webm output.wav`
- MP4 to MP3: `ffmpeg -i input.mp4 -vn -acodec libmp3lame output.mp3`
- Video compression: `ffmpeg -i input.mp4 -vf scale=1280:720 -crf 23 output.mp4`

## Error Handling
- If FFmpeg is not found, ensure ffmpeg-static is installed correctly
- Check file paths for spaces (use quotes)
- Verify input file exists and is not corrupted
- For unsupported formats, FFmpeg may need additional codecs

## Examples
- Converting a WhatsApp voice message from WebM to WAV for TTS:
  1. Install ffmpeg-static if needed
  2. Run: `ffmpeg -i JARVIS_voice.webm JARVIS_voice.wav`
  3. Verify the WAV file is created

This skill ensures reliable media conversions for various use cases.