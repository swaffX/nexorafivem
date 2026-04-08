/**
 * ============================================================
 *  Loading Screen — Configuration
 *  Edit everything here. No changes needed in other files.
 * ============================================================
 */

const CONFIG = {

  /* ----------------------------------------------------------
   *  SERVER IDENTITY
   * ---------------------------------------------------------- */
  server: {
    name:     'Nexora Roleplay',
    tagline:  'Hikayelerin Canlandığı Yer',
    subtitle: 'Türkiyenin En İyi Roleplay Deneyimi',
    logo:     'assets/logo.png',      // Set to '' to hide
  },

  /* ----------------------------------------------------------
   *  BACKGROUND VIDEO
   * ---------------------------------------------------------- */
  background: {
    video:          'assets/background.mp4',   // MP4 or WebM path
    fallbackColor:  '#080c14',                 // Shown if video fails
    overlayOpacity: 0.68,                      // 0 = transparent, 1 = black
  },

  /* ----------------------------------------------------------
   *  THEME COLORS
   *  All UI elements derive from these values automatically.
   * ---------------------------------------------------------- */
  theme: {
    primary:        '#c8a96e',          // Gold accent — buttons, bar, glows
    accent:         '#e8c87a',          // Lighter gold — gradients, highlights
    background:     '#080c14',          // Deep dark fallback
    textHighlight:  '#c8a96e',          // Inline highlighted text color
    overlayTint:    'rgba(5,8,18,0.55)',// Extra darkening gradient layer
  },

  /* ----------------------------------------------------------
   *  MUSIC PLAYER
   * ---------------------------------------------------------- */
  music: {
    autoplay:      true,
    defaultVolume: 0.25,         // 0.0 – 1.0
    playlist: [
      {
        title:     'CIKTIN KARSIMA 2.0',
        artist:    'DEEPRISE & JABBAR ft. UZI',
        src:       'assets/music/music1.mp3',
        thumbnail: '',            // Optional cover image path
      },
    ],
  },

  /* ----------------------------------------------------------
   *  STAFF PANEL
   * ---------------------------------------------------------- */
  staff: {
    enabled: true,
    title:   'NEXORA TEAM',
    members: [
      { name: 'swaffdev',   role: 'Developer',       avatar: 'assets/avatars/swaffdev.gif'  },
      { name: 'oguzxdev',   role: 'Developer',       avatar: 'assets/avatars/oguzdev.gif'  },
    ],
  },

  /* ----------------------------------------------------------
   *  SOCIAL LINKS
   *  platform: 'discord' | 'youtube' | 'instagram' | 'twitter'
   * ---------------------------------------------------------- */
  social: {
    links: [
      { platform: 'discord',   label: 'Discord',   url: 'https://discord.gg/Nexora'         },
    ],
  },

  /* ----------------------------------------------------------
   *  LOADING BAR
   * ---------------------------------------------------------- */
  loading: {
    text:         'Baglanti kuruluyor...',
    completeText: 'Nexora Roleplaye Hosgeldiniz',
    showPercent:  true,
  },

  /* ----------------------------------------------------------
   *  SECTION TOGGLES
   *  Set false to completely hide a section.
   * ---------------------------------------------------------- */
  sections: {
    showLogo:     true,
    showStaff:    true,
    showMusic:    true,
    showSocial:   true,
    showControls: true,   // Set false to hide the Show Controls button entirely
  },

  /* ----------------------------------------------------------
   *  SERVER KEYBINDS
   *  Displayed in the controls panel when the player clicks
   *  "Show Controls". Add, remove, or reorder freely.
   * ---------------------------------------------------------- */
  controls: [
    { key: 'F2',  label: 'Envanter'   },
    { key: 'M',   label: 'Telefon'       },
    { key: '~',   label: 'Eller Yukari'    },
    { key: 'F3',  label: 'Animasyon Menu'  },
    { key: 'F8',  label: 'Scoreboard'  },
    { key: 'R',   label: 'Sarjor Degistir'      },
    { key: 'G',   label: 'Bagaj'       },
  ],

};
