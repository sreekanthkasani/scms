from youtube_transcript_api import YouTubeTranscriptApi

# Function to fetch transcript
def fetch_transcript(video_id):
    try:
        transcript = YouTubeTranscriptApi.get_transcript(video_id)
        return transcript
    except Exception as e:
        return str(e)

# Main function
if __name__ == '__main__':
    video_url = input('Enter YouTube video URL: ')
    video_id = video_url.split('v=')[1]
    transcript = fetch_transcript(video_id)
    print('Transcript:')
    print(transcript)
