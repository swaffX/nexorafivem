const config = {
    background: {
        type: "video", // "image" or "video"
        source: "https://www.youtube.com/embed/f1MAEDPcUC0?si=-MSLEcQxN5YRTZBK", // Path to image file or YouTube embed link
        videoOptions: {
            loop: true, // Should the video loop continuously?
            muted: true, // Should the video be muted?
            opacity: 0.7 // Background video opacity (between 0-1)
        }
    },
    serverInfo: {
        name: "easy 232",
        description: "LOADING SCREEN",
        loadingText: "Loading files",
        loadingDescription: "Please be patient and wait for your server files to load. This may take some time."
    },
    
    rulesTitle: "SERVER RULES",
    rules: [
        {
            number: 1,
            title: "RDM/VDM Prohibited",
            description: "Random Death Match and Vehicle Death Match are strictly prohibited. Killing players without roleplay is forbidden."
        },
        {
            number: 2,
            title: "Roleplay Quality",
            description: "High quality roleplay is expected. Act according to your role and don't disrupt other players' roles."
        },
        {
            number: 3,
            title: "Be Respectful",
            description: "Be respectful to all players. Insults, racism and discrimination are strictly prohibited."
        },
        {
            number: 4,
            title: "No Mic Spam",
            description: "Making disturbing noises and playing music through the microphone is prohibited."
        },
        {
            number: 5,
            title: "Combat Logging",
            description: "Leaving the game during roleplay (Combat Logging) is prohibited and will be punished."
        }
    ],
    
    mediaTitle: "SERVER MEDIA",
    serverMedia: [
        {
            type: "image",
            source: "img/car-img.png",
            title: "New Vehicles"
        },
        {
            type: "youtube",
            source: "https://www.youtube.com/watch?v=dQw4w9WgXcQ",
            title: "Server Trailer"
        },
        {
            type: "image",
            source: "img/car-imgone.png",
            title: "Server Event"
        }
    ],
    currentMediaIndex: 0,
    
    serverTeam: {
        title: "SERVER TEAM",
        subtitle: "BEST OF THE BEST SERVER TEAM",
        currentPage: 0,
        membersPerPage: 5,
        members: [
            {
                name: "Kim Chan",
                role: "Developer",
                image: "img/gta-logo.png",
                description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
            },
            {
                name: "John Doe",
                role: "Administrator",
                image: "img/gta-logo.png",
                description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
            },
            {
                name: "Jane Smith",
                role: "Moderator",
                image: "img/gta-logo.png",
                description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
            },
            {
                name: "Mike Johnson",
                role: "Support",
                image: "img/gta-logo.png",
                description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
            },
            {
                name: "Sarah Williams",
                role: "Developer",
                image: "img/gta-logo.png",
                description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
            },
            {
                name: "Alex Brown",
                role: "Game Master",
                image: "img/gta-logo.png", 
                description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
            },
            {
                name: "Chris Taylor",
                role: "Community Manager",
                image: "img/gta-logo.png",
                description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
            },
            {
                name: "Megan Jones",
                role: "Senior Developer",
                image: "img/gta-logo.png",
                description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
            },
            {
                name: "Kevin Lewis",
                role: "Designer",
                image: "img/gta-logo.png",
                description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
            },
            {
                name: "Jessica Wright",
                role: "Events Manager",
                image: "img/gta-logo.png",
                description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
            },
            {
                name: "David Clark",
                role: "Head Admin",
                image: "img/gta-logo.png",
                description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
            },
            {
                name: "Emma White",
                role: "Support Manager",
                image: "img/gta-logo.png",
                description: "Lorem ipsum dolor sit amet, consectetur adipiscing elit."
            }
        ]
    },
    
    serverUpdates: {
        title: "SERVER UPDATES",
        subtitle: "CHECK LATEST SERVER UPDATES HERE!",
        currentPage: 0,
        updatesPerPage: 4,
        updates: [
            {
                date: "2025-03-21",
                title: "NEW CARS",
                description: "Added new cars in server read more in discord platform",
                image: "img/car-imgone.png",
                platform: "discord" // discord, website, instagram, twitter
            },
            {
                date: "2025-03-18",
                title: "NEW JOBS",
                description: "Added new job opportunities with great salary. Check discord for details!",
                image: "img/car-imgone.png",
                platform: "discord"
            },
            {
                date: "2025-03-15",
                title: "MAP UPDATE",
                description: "We've expanded the city with new areas and buildings",
                image: "img/car-imgone.png",
                platform: "website"
            },
            {
                date: "2025-03-15",
                title: "MAP UPDATE",
                description: "We've expanded the city with new areas and buildings",
                image: "img/car-imgone.png",
                platform: "website"
            },
            {
                date: "2025-03-15",
                title: "MAP UPDATE",
                description: "We've expanded the city with new areas and buildings",
                image: "img/car-imgone.png",
                platform: "website"
            },
            {
                date: "2025-03-10",
                title: "SERVER RESTART",
                description: "Server will be restarted for maintenance on Friday",
                image: "img/car-imgone.png",
                platform: "twitter"
            }
        ]
    },
    
    socialMedia: {
        enabled: true,
        links: [
            {
                platform: "instagram",
                url: "https://www.instagram.com/",
                icon: "fa-brands fa-instagram",
                color: "#E396FF",
                enabled: true
            },
            {
                platform: "twitter",
                url: "https://twitter.com/",
                icon: "fa-brands fa-twitter",
                color: "#74B5FF",
                enabled: true
            },
            {
                platform: "youtube",
                url: "https://www.youtube.com/",
                icon: "fa-brands fa-youtube",
                color: "#FC667A",
                enabled: true
            },
            {
                platform: "discord",
                url: "https://discord.com/",
                icon: "fa-brands fa-discord",
                color: "#8A8CFF",
                enabled: true
            },
            {
                platform: "website",
                url: "https://www.example.com/",
                icon: "fa-solid fa-globe",
                color: "#71BA69",
                enabled: true
            }
        ]
    },
    
    music: {
        enabled: true,
        showPlayer: true,
        nowPlayingText: "NOW PLAYING",
        autoplay: true,
        volume: 0.3,
        currentTrackIndex: 0,
        playlist: [
            {
                title: "OGUZ ALPER OKTEM",
                artist: "Organize",
                file: "music/organ.mp3"
            },
            {
                title: " HA HA HA HA",
                artist: "LVBEL C5",
                file: "music/lvbel.mp3"
            },
        ]
    },
    
    miniGames: {
        enabled: true,
        title: "LOADING SCREEN GAMES",
        subtitle: "PLAY SOME GAMES WHILE WAITING",
        currentPage: 0,
        gamesPerPage: 5,
        games: [
            {
                title: "Subway Surfer",
                description: "Subway Surfer game",
                embed: 'https://www.bubbleshooter.net/embed.php?id=555',
                photo: './img/subway-surfer.png',
                logo: "img/subway-logo.png",
                icon: "fa-solid fa-gamepad"
            },
            {
                title: "Going Ball",
                description: "Going Ball game",
                embed: 'https://html5.gamedistribution.com/2d44a0c8ce704965b2031bcc4ae6a9a8/',
                photo: './img/mini-golf.png',
                logo: "img/images.jpg",
                icon: "fa-solid fa-gamepad"
            },
            {
                title: "Redball",
                description: "Redball game",
                embed: 'https://www.bubbleshooter.net/embed.php?id=1652',
                photo: './img/ate.png',
                logo: "img/redbal-logo.png",
                icon: "fa-solid fa-gamepad"
            },
            {
                title: "8-BALL POOL",
                description: "Fun 8-ball pool game",
                embed: 'https://html5.gamedistribution.com/d02120780e594158ab61869028223cf1/',
                photo: './img/ball-poll.png',
                logo: "img/ball-logo.png",
                icon: "fa-solid fa-gamepad"
            },
            {
                title: "Mini Golf",
                description: "Mini golf game",
                embed: 'https://html5.gamedistribution.com/7ffec8d4951a493ca14c949a80512999/',
                photo: './img/golf-logo.png',
                logo: "img/golf-logo.png",
                icon: "fa-solid fa-gamepad"
            }
        ]
    },
    
    serverHotkeys: {
        title: "SERVER HOTKEYS",
        subtitle: "CLICK A KEY TO SEE ITS DESCRIPTION",
        keys: [
            { key: "ESC", description: "Pause Menu", active: true },
            { key: "F1", description: "", active: false },
            { key: "F2", description: "", active: false },
            { key: "F3", description: "", active: false },
            { key: "F4", description: "", active: false },
            { key: "F5", description: "", active: false },
            { key: "F6", description: "", active: false },
            { key: "F7", description: "", active: false },
            { key: "F8", description: "", active: false },
            { key: "F9", description: "", active: false },
            { key: "F10", description: "", active: false },
            { key: "F11", description: "", active: false },
            { key: "F12", description: "", active: false },
            { key: "PRNSC", description: "", active: false },
            
            { key: "`", description: "", active: false },
            { key: "1", description: "Inventory Slot 1", active: true },
            { key: "2", description: "Inventory Slot 2", active: true },
            { key: "3", description: "Inventory Slot 3", active: true },
            { key: "4", description: "Inventory Slot 4", active: true },
            { key: "5", description: "Inventory Slot 5", active: false },
            { key: "6", description: "", active: false },
            { key: "7", description: "", active: false },
            { key: "8", description: "", active: false },
            { key: "9", description: "", active: false },
            { key: "0", description: "", active: false },
            { key: "-", description: "", active: false },
            { key: "=", description: "", active: false },
            { key: "DELETE", description: "", active: false },
            
            { key: "TAB", description: "", active: false },
            { key: "Q", description: "", active: false },
            { key: "W", description: "Move forward", active: true },
            { key: "A", description: "Move left", active: true },
            { key: "S", description: "Move backward", active: true },
            { key: "D", description: "Move right", active: true },
            { key: "E", description: "", active: false },
            { key: "R", description: "", active: false },
            { key: "T", description: "", active: false },
            { key: "Y", description: "", active: false },
            { key: "U", description: "", active: false },
            { key: "I", description: "", active: false },
            { key: "O", description: "", active: false },
            { key: "P", description: "", active: false },
            { key: "[", description: "", active: false },
            { key: "]", description: "", active: false },
            
            { key: "CAPS", description: "", active: false },
            { key: "F", description: "", active: false },
            { key: "G", description: "", active: false },
            { key: "H", description: "", active: false },
            { key: "J", description: "", active: false },
            { key: "K", description: "", active: false },
            { key: "L", description: "", active: false },
            { key: ";", description: "", active: false },
            { key: "'", description: "", active: false },
            { key: "ENTER", description: "", active: false },
            
            { key: "SHIFT", description: "", active: false },
            { key: "Z", description: "", active: false },
            { key: "X", description: "", active: false },
            { key: "C", description: "", active: false },
            { key: "V", description: "", active: false },
            { key: "B", description: "", active: false },
            { key: "N", description: "", active: false },
            { key: "M", description: "", active: false },
            { key: ",", description: "", active: false },
            { key: ".", description: "", active: false },
            { key: "/", description: "", active: false },
            
            { key: "CTRL", description: "", active: false },
            { key: "ALT", description: "", active: false },
            { key: "SPACE", description: "", active: false },
            
            { key: "UP", description: "", active: false },
            { key: "DOWN", description: "", active: false },
            { key: "LEFT", description: "", active: false },
            { key: "RIGHT", description: "", active: false }
        ]
    }
};

window.config = config; 