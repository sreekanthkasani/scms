import whisper
import youtube_dl

# Function to download YouTube video audio
def download_audio(url):
    ydl_opts = {
        'format': 'bestaudio/best',
        'postprocessors': [{
            'key': 'FFmpegExtractAudio',
            'preferredcodec': 'mp3',
            'preferredquality': '192',
        }],
        'outtmpl': 'audio.mp3',
    }
    with youtube_dl.YoutubeDL(ydl_opts) as ydl:
        ydl.download([url])

# Function to transcribe audio using Whisper
def transcribe_audio(model_name='base'):
    model = whisper.load_model(model_name)
    result = model.transcribe('audio.mp3')
    return result['text']

# Main function
if __name__ == '__main__':
    youtube_url = input('Enter YouTube video URL: ')
    download_audio(youtube_url)
    transcription = transcribe_audio()
    print('Transcription:')
    print(transcription)
