# QuickFFSync 🚀

A Python GUI for **FFmpeg** with **Intel Quick Sync hardware encoding** (HEVC / H.264 / AV1 / VP9).  
It provides a simple dark-themed interface with drag-and-drop support, presets, trimming, previews, and advanced encoder/audio/FPS options – no need to manually write FFmpeg commands.

---

## Features

- **Drag and drop** video files into the window
- **Codec support:** HEVC (H.265), H.264, AV1, VP9 via Intel Quick Sync
- **Bitrate mode** or **Intelligent Constant Quality (ICQ) mode**
- **Audio settings:** disable, copy, AAC (96k / 160k / 256k) or custom
- **Advanced encoder options:**
  - Async Depth, Threads, Presets
  - Profiles (main, main10, baseline, high, etc.)
  - Scenarios (archive, livestreaming, videoconference, etc.)
  - Rate-control (VBR, CBR)
  - QSV-specific toggles: RDO, MBBRC, Extended BRC, Look Ahead Depth
- **FPS and scaling settings**
  - Change FPS (source, 60, 50, 30, 23.976, custom)
  - Resize to HD/FHD/QHD/4K/Custom width
  - Interpolation algorithms (bilinear, bicubic, neighbor, area, lanczos, spline)
- **Additional options**
  - Visual trimming with interactive slider and thumbnail preview
  - Streamcopy mode
  - Add custom FFmpeg options
  - Video filters (speed control, sharpness, saturation, denoise, HDR→SDR, crop, etc.)
  - Audio filters (atempo, loudnorm, volume, etc.)
- **Presets system** for quick configuration (FHD Fast, FHD Quality, HD Fast, HD Quality)
- **10-second preview** encoding with current settings
- **Estimated output size** (bitrate mode only)
- **Built-in player buttons:** Play Input, Play Preview, Play Output
- **Command preview** – shows full FFmpeg command, editable, copyable
- **Real-time progress tracking** during conversion

---

## Getting Started

### Prerequisites

To use QuickFFSync, you will need:

* **Windows Operating System:** The application is built for Windows 10/11.
* **FFmpeg:** You need to have FFmpeg installed on your system and its executable (`ffmpeg.exe`) accessible in your system's PATH, or specify its path within the application.
* **Intel CPU with Quick Sync:** For hardware-accelerated encoding, an Intel processor with Quick Sync Video technology is required. Ensure you have the latest Intel graphics drivers installed.

### Installation

#### 1. Download the Executable (Recommended) 🚀

The easiest way to get started is to download the latest release executable (`.exe`) from the [Releases](#) page.

1.  Go to the [Releases](#) section of this repository.
2.  Download the `QuickFFSync.exe` file.
3.  Run the executable.

#### 2. Run from Source (For Developers) 🔧

If you want to run the application from its Python source code:

1.  **Clone the repository:**
    ```
    git clone [repository-url]
    cd QuickFFSync
    ```
2.  **Install dependencies:**
    The project uses `customtkinter`, `pillow`, `pywin32` (for `win32gui`, `win32con`, `win32api`).
    ```bash
    pip install customtkinter pillow pywin32
    ```
3.  **Run the application:**
    ```
    python QuickFFSync.py
    ```

### Building Executable (For Developers) 🔧

You can compile the Python script into a standalone Windows executable (`.exe`) using **Nuitka**.

1.  **Install Nuitka:**
    ```
    pip install nuitka
    ```
2.  **Build the executable:**
    Navigate to the project's root directory in your terminal and run the following command:

    ```
    python -m nuitka --msvc=latest --standalone --windows-console-mode=disable ^
    --include-package=customtkinter --enable-plugin=tk-inter ^
    --windows-icon-from-ico="qff.ico" ^
    --include-data-file=qff.ico=./ ^
    --include-data-file=qff-help.txt=./qff-help.txt ^
    --product-name="QuickFFSync" ^
    --product-version="1.0.0" ^
    --file-version="1.0.0" ^
    --file-description="QuickFFSync" ^
    --company-name="QuickFFSync" ^
    --copyright="Copyright (C) 2025" ^
    --output-dir=build QuickFFSync.py
    ```
    The compiled executable will be found in the `build` directory.

---

## Usage 🎥

1.  **Launch the application:** Run the `.exe` file or `QuickFFSync.py`.
2.  **Select Input File:** Click the "Browse" button or drag and drop your video file into the designated area.
3.  **Specify Output File:** Click "Save As" to choose where to save your processed video.
4.  **Configure Options:**
    * **Video Codec:** Select HEVC, H.264, AV1, or VP9
    * **Quality/Bitrate:** Choose between Intelligent Constant Quality or traditional bitrate mode
    * **Trim Video:** Use the visual slider or enter start/end times in `HH:MM:SS` format
    * **Audio Settings:** Configure audio codec and bitrate
    * **Advanced Options:** Access encoder settings, FPS/scaling, and additional filters
5.  **Preview:** Click "Play 10s Preview" to test your settings before full conversion
6.  **Start Processing:** Click the "Convert" button to begin the video encoding
7.  **Monitor Progress:** Watch real-time progress and FFmpeg output in the interface

---

## Easy Access via Windows "Send to" Context Menu 📁

1. Press **Win+R**, type:
   ```
   %APPDATA%\Microsoft\Windows\SendTo
   ```
2. Create a shortcut to QuickFFSync.exe in this folder
3. You can rename it and set a custom icon
4. Right-click any video file and use "Send to" → QuickFFSync to quickly open files

---

## Contributing

If you have a suggestion that would make this better, you can simply open an issue with the tag "enhancement" or "bug".

## Notes

- This app is designed for Intel CPUs that support **Quick Sync hardware encoding**
- For NVIDIA GPUs, consider using NVENC-based tools
- For AMD GPUs, consider using AMF-based tools
- The tool is intended for Windows only
- Make sure FFmpeg is compiled with Intel Quick Sync support for optimal performance