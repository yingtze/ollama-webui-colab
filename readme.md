# **Run Ollama with OpenWebUI on Google Colab**

Ini adalah contoh program dalam notebook yang bisa langsung digunakan. Cukup klik ikon di bawah ini untuk membuka url google colab :
[![Open In Colab](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/yingtze/ollama-webui-colab/blob/main/Ollama_OpenWebUI_Colab.ipynb) <br>

Notebook v2 -> [![Project Colab v2](https://colab.research.google.com/assets/colab-badge.svg)](https://colab.research.google.com/github/yingtze/ollama-webui-colab/blob/main/Ollama_OpenWebUI_colab_v2.ipynb) <br>

## **Cara Penggunaan**

### 1. Atur Runtime di Google Colab
- Klik menu **Runtime** di Google Colab.
- Pilih **Change runtime type** dan pastikan opsi **T4 GPU** dipilih.

### 2. Verifikasi GPU
- Jalankan perintah berikut di **code cell** untuk memastikan host machine menggunakan GPU NVIDIA:
  ```bash
  !nvidia-smi
  ```

### 3. Clone Repository
- Clone repository dengan perintah:
  ```bash
  !git clone https://github.com/yingtze/ollama-webui-colab.git
  ```

### 4. Atur Izin Eksekusi
- Jalankan perintah berikut untuk memberikan izin eksekusi pada skrip yang diperlukan:
  ```bash
  !chmod +x ollama-webui-colab/install_program.sh ollama-webui-colab/download_model.sh ollama-webui-colab/start.sh
  ```
- Alternatifnya, bisa juga **drag and drop** file dari folder `ollama-webui-colab` ke luar atau ubah **working directory** ke folder tersebut sesuai metode yang diinginkan.

### 5. Instalasi Dependency
- Jalankan perintah berikut untuk menginstal semua dependency yang diperlukan:
  ```bash
  !./ollama-webui-colab/install_program.sh
  ```

### 6. Unduh Model LLM
- Gunakan perintah berikut untuk mengunduh model dari repository Ollama:
  ```bash
  !./ollama-webui-colab/download_model.sh --model {nama_model}
  ```
- **Contoh penggunaan:** Untuk mengunduh model `deepseek-r1:1.5b`, jalankan:
  ```bash
  !./ollama-webui-colab/download_model.sh --model deepseek-r1:1.5b
  ```

### 7. Menjalankan Aplikasi
- Jalankan aplikasi dengan perintah:
  ```bash
  !./ollama-webui-colab/start.sh
  ```
- Tunggu hingga **Cloudflare** memberikan **link URL** di terminal.
- **Akses URL tersebut**, daftarkan akun jika belum memiliki, lalu aplikasi siap digunakan.