document.addEventListener('DOMContentLoaded', function() {
    const app = Vue.createApp({
        data() {
            return {
                config: window.config,
                loadingProgress: 0,
                currentMedia: {},
                showMediaModal: false,
                newMedia: {
                    type: 'image',
                    source: '',
                    title: ''
                },
                audioPlayer: null,
                isPlaying: false,
                currentTrack: {},
                currentTime: 0,
                duration: 0,
                musicProgress: 0,
                updateTimeInterval: null,
                showServerTeam: false,
                currentTeamMembers: [],
                totalTeamPages: 0,
                showServerUpdates: false,
                currentUpdates: [],
                totalUpdatePages: 0,
                showMiniGames: false,
                showGameFrame: false,
                currentGameEmbed: '',
                currentGames: [],
                currentMinigameSection: -1,
                teamMembers: [],
                isMusicPlaying: false,
                currentMusicIndex: 0,
                music: null,
                musicDuration: 0,
                musicCurrentTime: 0,
                musicVolume: window.config.music.volume,
                showHotkeys: false,
                showGallery: false,
                currentGalleryIndex: 0,
            }
        },
        methods: {
            findKey(keyName) {
                if (!this.config.serverHotkeys || !this.config.serverHotkeys.keys) return null;
                return this.config.serverHotkeys.keys.find(key => key.key === keyName);
            },
            nextMedia() {
                let currentIndex = this.config.currentMediaIndex;
                currentIndex++;
                if (currentIndex >= this.config.serverMedia.length) {
                    currentIndex = 0;
                }
                this.config.currentMediaIndex = currentIndex;
                this.updateCurrentMedia();
            },
            prevMedia() {
                let currentIndex = this.config.currentMediaIndex;
                currentIndex--;
                if (currentIndex < 0) {
                    currentIndex = this.config.serverMedia.length - 1;
                }
                this.config.currentMediaIndex = currentIndex;
                this.updateCurrentMedia();
            },
            updateCurrentMedia() {
                this.currentMedia = this.config.serverMedia[this.config.currentMediaIndex];
            },
            openYouTube() {
                if (this.currentMedia.type === 'youtube' && this.currentMedia.source) {
                    if ('window' in window && 'invokeNative' in window) {
                        window.invokeNative('openUrl', this.currentMedia.source);
                    } else {
                        window.open(this.currentMedia.source, '_blank');
                    }
                }
            },
            openSocialLink(url) {
                if (url) {
                    if ('window' in window && 'invokeNative' in window) {
                        window.invokeNative('openUrl', url);
                    } else {
                        window.open(url, '_blank');
                    }
                }
            },
            updateSocialMediaConfig(platform, enabled) {
                for (let i = 0; i < this.config.socialMedia.links.length; i++) {
                    if (this.config.socialMedia.links[i].platform === platform) {
                        this.config.socialMedia.links[i].enabled = enabled;
                        break;
                    }
                }
            },
            initMusicPlayer() {
                if (!this.config.music.enabled) return;
                if (this.audioPlayer) {
                    this.audioPlayer.pause();
                    this.audioPlayer = null;
                    clearInterval(this.updateTimeInterval);
                }
                this.updateCurrentTrack();
                this.audioPlayer = new Audio(this.currentTrack.file);
                this.audioPlayer.volume = this.config.music.volume;
                this.audioPlayer.muted = false;
                this.audioPlayer.autoplay = true;
                this.audioPlayer.preload = "auto";
                this.playAudio();
                this.audioPlayer.addEventListener('loadedmetadata', () => {
                    this.duration = this.audioPlayer.duration;
                });
                this.audioPlayer.addEventListener('timeupdate', () => {
                    this.currentTime = this.audioPlayer.currentTime;
                    this.musicProgress = (this.currentTime / this.duration) * 100;
                });
                this.audioPlayer.addEventListener('ended', () => {
                    this.nextTrack();
                });
                this.audioPlayer.addEventListener('canplaythrough', () => {
                    if (this.config.music.autoplay && !this.isPlaying) {
                        this.playAudio();
                    }
                });
                setTimeout(() => {
                    if (!this.isPlaying && this.config.music.autoplay) {
                        this.playAudio();
                    }
                }, 1000);
            },
            togglePlay() {
                if (!this.audioPlayer) return;
                if (this.isPlaying) {
                    this.pauseAudio();
                } else {
                    this.playAudio();
                }
            },
            playAudio() {
                if (!this.audioPlayer) return;
                const originalVolume = this.audioPlayer.volume;
                this.audioPlayer.volume = 0;
                const playPromise = this.audioPlayer.play();
                if (playPromise !== undefined) {
                    playPromise.then(_ => {
                        this.isPlaying = true;
                        setTimeout(() => {
                            this.audioPlayer.volume = originalVolume;
                        }, 100);
                    })
                    .catch(error => {
                        this.audioPlayer.volume = originalVolume;
                    });
                } else {
                    this.isPlaying = true;
                    setTimeout(() => {
                        this.audioPlayer.volume = originalVolume;
                    }, 100);
                }
            },
            pauseAudio() {
                if (!this.audioPlayer) return;
                this.audioPlayer.pause();
                this.isPlaying = false;
            },
            nextTrack() {
                let currentIndex = this.config.music.currentTrackIndex;
                currentIndex++;
                if (currentIndex >= this.config.music.playlist.length) {
                    currentIndex = 0;
                }
                this.config.music.currentTrackIndex = currentIndex;
                this.reinitMusicPlayer();
            },
            prevTrack() {
                let currentIndex = this.config.music.currentTrackIndex;
                currentIndex--;
                if (currentIndex < 0) {
                    currentIndex = this.config.music.playlist.length - 1;
                }
                this.config.music.currentTrackIndex = currentIndex;
                this.reinitMusicPlayer();
            },
            reinitMusicPlayer() {
                const wasPlaying = this.isPlaying;
                const volume = this.audioPlayer ? this.audioPlayer.volume : this.config.music.volume;
                this.initMusicPlayer();
                if (this.audioPlayer) {
                    this.audioPlayer.volume = volume;
                }
                if (wasPlaying) {
                    this.playAudio();
                }
            },
            seekTrack(event) {
                if (!this.audioPlayer || !this.duration) return;
                const seekBar = event.currentTarget;
                const rect = seekBar.getBoundingClientRect();
                const seekPos = (event.clientX - rect.left) / rect.width;
                this.audioPlayer.currentTime = this.duration * seekPos;
            },
            adjustVolume(event) {
                if (!this.audioPlayer) return;
                const volumeBar = event.currentTarget;
                const rect = volumeBar.getBoundingClientRect();
                let volume = (event.clientX - rect.left) / rect.width;
                volume = Math.max(0, Math.min(1, volume));
                this.audioPlayer.volume = volume;
                this.config.music.volume = volume;
            },
            formatTime(seconds) {
                if (isNaN(seconds) || !isFinite(seconds)) {
                    return '0:00';
                }
                const minutes = Math.floor(seconds / 60);
                const remainingSeconds = Math.floor(seconds % 60);
                return `${minutes}:${remainingSeconds < 10 ? '0' : ''}${remainingSeconds}`;
            },
            updateCurrentTrack() {
                if (this.config.music.playlist.length === 0) {
                    this.currentTrack = { title: 'Şarkı yok', artist: '', file: '' };
                    return;
                }
                const index = this.config.music.currentTrackIndex;
                this.currentTrack = this.config.music.playlist[index];
            },
            simulateLoading() {
                const interval = setInterval(() => {
                    if (this.loadingProgress < 100) {
                        this.loadingProgress += Math.floor(Math.random() * 10) + 1;
                        if (this.loadingProgress > 100) {
                            this.loadingProgress = 100;
                        }
                    } else {
                        clearInterval(interval);
                    }
                }, 500);
            },
            addMedia() {
                if (!this.newMedia.source || !this.newMedia.title) {
                    alert('Lütfen tüm alanları doldurun!');
                    return;
                }
                if (this.newMedia.type === 'youtube') {
                    if (!this.isValidYouTubeUrl(this.newMedia.source)) {
                        alert('Lütfen geçerli bir YouTube linki girin!');
                        return;
                    }
                }
                this.config.serverMedia.push({
                    type: this.newMedia.type,
                    source: this.newMedia.source,
                    title: this.newMedia.title
                });
                this.newMedia = {
                    type: 'image',
                    source: '',
                    title: ''
                };
                this.showMediaModal = false;
                if (this.config.serverMedia.length === 1) {
                    this.config.currentMediaIndex = 0;
                    this.updateCurrentMedia();
                }
            },
            isValidYouTubeUrl(url) {
                const pattern = /^(https?:\/\/)?(www\.)?(youtube\.com|youtu\.?be)\/.+$/;
                return pattern.test(url);
            },
            openMediaModal() {
                this.showMediaModal = true;
            },
            toggleServerTeam() {
                this.showServerTeam = !this.showServerTeam;
                if (this.showServerTeam) {
                    this.showServerUpdates = false;
                    this.showMiniGames = false;
                    this.updateTeamMembers();
                }
            },
            toggleServerUpdates() {
                this.showServerUpdates = !this.showServerUpdates;
                if (this.showServerUpdates) {
                    this.showServerTeam = false;
                    this.showMiniGames = false;
                    this.updateUpdatesPage();
                }
            },
            updateUpdatesPage() {
                this.totalUpdatePages = Math.ceil(this.config.serverUpdates.updates.length / this.config.serverUpdates.updatesPerPage);
                const startIndex = this.config.serverUpdates.currentPage * this.config.serverUpdates.updatesPerPage;
                const endIndex = startIndex + this.config.serverUpdates.updatesPerPage;
                this.currentUpdates = [];
                this.$nextTick(() => {
                    this.currentUpdates = this.config.serverUpdates.updates.slice(startIndex, endIndex);
                });
            },
            nextUpdatePage() {
                if (this.config.serverUpdates.currentPage < this.totalUpdatePages - 1) {
                    this.config.serverUpdates.currentPage++;
                    this.updateUpdatesPage();
                }
            },
            prevUpdatePage() {
                if (this.config.serverUpdates.currentPage > 0) {
                    this.config.serverUpdates.currentPage--;
                    this.updateUpdatesPage();
                }
            },
            getPlatformIcon(platform) {
                switch(platform) {
                    case 'discord':
                        return 'fa-brands fa-discord';
                    case 'website':
                        return 'fa-solid fa-globe';
                    case 'instagram':
                        return 'fa-brands fa-instagram';
                    case 'twitter':
                        return 'fa-brands fa-twitter';
                    default:
                        return 'fa-solid fa-globe';
                }
            },
            getPlatformColor(platform) {
                switch(platform) {
                    case 'discord':
                        return '#8A8CFF';
                    case 'website':
                        return '#71BA69';
                    case 'instagram':
                        return '#E396FF';
                    case 'twitter':
                        return '#74B5FF';
                    default:
                        return '#71BA69';
                }
            },
            updateTeamMembers() {
                this.totalTeamPages = Math.ceil(this.config.serverTeam.members.length / this.config.serverTeam.membersPerPage);
                const startIndex = this.config.serverTeam.currentPage * this.config.serverTeam.membersPerPage;
                const endIndex = startIndex + this.config.serverTeam.membersPerPage;
                this.currentTeamMembers = [];
                this.currentTeamMembers = this.config.serverTeam.members.slice(startIndex, endIndex);
            },
            nextTeamPage() {
                if (this.config.serverTeam.currentPage < this.totalTeamPages - 1) {
                    this.config.serverTeam.currentPage++;
                    this.updateTeamMembers();
                }
            },
            prevTeamPage() {
                if (this.config.serverTeam.currentPage > 0) {
                    this.config.serverTeam.currentPage--;
                    this.updateTeamMembers();
                }
            },
            toggleMiniGames() {
                this.showMiniGames = !this.showMiniGames;
                if (this.showMiniGames) {
                    this.updateCurrentGames();
                    this.showServerUpdates = false;
                    this.showServerTeam = false;
                    this.showHotkeys = false;
                }
            },
            toggleHotkeys() {
                this.showHotkeys = !this.showHotkeys;
                if (this.showHotkeys) {
                    this.showMiniGames = false;
                    this.showServerUpdates = false;
                    this.showServerTeam = false;
                }
            },
            updateCurrentGames() {
                const maxGames = Math.min(5, this.config.miniGames.games.length);
                this.currentGames = this.config.miniGames.games.slice(0, maxGames);
            },
            openGame(embedUrl) {
                this.currentGameEmbed = embedUrl;
                this.showGameFrame = true;
            },
            closeGame() {
                this.showGameFrame = false;
                this.currentGameEmbed = '';
            },
            openGallery(index) {
                this.currentGalleryIndex = index || 0;
                this.showGallery = true;
            },
            closeGallery() {
                this.showGallery = false;
            },
            nextGalleryImage() {
                this.currentGalleryIndex++;
                if (this.currentGalleryIndex >= this.config.serverMedia.length) {
                    this.currentGalleryIndex = 0;
                }
            },
            prevGalleryImage() {
                this.currentGalleryIndex--;
                if (this.currentGalleryIndex < 0) {
                    this.currentGalleryIndex = this.config.serverMedia.length - 1;
                }
            },
            getCurrentGalleryMedia() {
                return this.config.serverMedia[this.currentGalleryIndex];
            },
            isYoutubeUrl(url) {
                if (!url) return false;
                const pattern = /^(https?:\/\/)?(www\.)?(youtube\.com|youtu\.?be)\/.+$/;
                return pattern.test(url);
            },
            convertToEmbedUrl(url) {
                if (!url) return '';
                let videoId = '';
                if (url.includes('youtube.com/watch')) {
                    const match = url.match(/[?&]v=([^&]+)/);
                    if (match && match[1]) {
                        videoId = match[1];
                    }
                } else if (url.includes('youtu.be')) {
                    const match = url.match(/youtu\.be\/([^?&]+)/);
                    if (match && match[1]) {
                        videoId = match[1];
                    }
                } else if (url.includes('youtube.com/embed')) {
                    const match = url.match(/embed\/([^/?&]+)/);
                    if (match && match[1]) {
                        videoId = match[1];
                    }
                }
                if (videoId) {
                    return `https://www.youtube.com/embed/${videoId}?autoplay=1&mute=1&loop=1&playlist=${videoId}&controls=0&showinfo=0&rel=0&iv_load_policy=3&modestbranding=1&vq=hd1080&fs=1&disablekb=1&enablejsapi=1&widgetid=1&origin=${window.location.origin}&playsinline=0&autohide=1&start=0`;
                }
                return url;
            }
        },
        mounted() {
            this.updateCurrentMedia();
            this.showGallery = false;
            document.body.style.backgroundImage = 'none';
            this.simulateLoading();
            document.addEventListener('click', () => {
                if (!this.isPlaying && this.config.music.autoplay) {
                    this.initMusicPlayer();
                }
            }, { once: true });
            this.initMusicPlayer();
            window.addEventListener('load', () => {
                if (!this.isPlaying && this.config.music.autoplay) {
                    setTimeout(() => {
                        this.playAudio();
                    }, 2000);
                }
            });
            this.updateTeamMembers();
            this.updateUpdatesPage();
            this.updateCurrentGames();
            document.addEventListener('keydown', (e) => {
                if (this.showGallery) {
                    if (e.key === 'ArrowRight' || e.key === 'Right') {
                        this.nextGalleryImage();
                    } else if (e.key === 'ArrowLeft' || e.key === 'Left') {
                        this.prevGalleryImage();
                    } else if (e.key === 'Escape' || e.key === 'Esc') {
                        this.closeGallery();
                    }
                }
                if (e.ctrlKey && e.key === 'm') {
                    e.preventDefault();
                    this.openMediaModal();
                }
            });
            window.addEventListener('message', function(event) {
                var data = event.data;
                if (data.type === 'updateProgress') {
                    app.loadingProgress = data.progress;
                }
            });
        }
    }).mount('#app');
});
