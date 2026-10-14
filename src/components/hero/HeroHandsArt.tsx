import type { CSSProperties } from "react";

type ArtProps = {
  className?: string;
  style?: CSSProperties;
};

const outline = "var(--color-ink)";

export function LeftHandArt({ className, style }: ArtProps) {
  return (
    <svg
      viewBox="0 0 720 560"
      className={className}
      style={style}
      role="img"
      aria-label="Illustrated left hand holding a note"
      focusable="false"
    >
      <g stroke={outline} strokeWidth="8" strokeLinecap="round" strokeLinejoin="round">
        <path
          d="M0 360 152 316l84 190-153 54-83-20Z"
          fill="var(--color-muted)"
        />
        <path d="m108 333 80 190" fill="none" />
        <path d="m28 389 106-30 20 42-108 31Z" fill="var(--color-accent)" />

        <path
          d="M280 278c-12-21-6-45 9-60L416 94c16-16 42-16 58-1 15 15 14 39-1 55L360 270l-33 44Z"
          fill="var(--color-text)"
        />
        <path
          d="M332 310c-11-21-3-43 14-58l131-114c17-14 42-10 55 8 13 18 9 42-8 57L405 317l-34 25Z"
          fill="var(--color-text)"
        />
        <path
          d="M367 351c-9-22-2-42 16-55l118-82c18-12 42-6 54 12 11 18 6 40-10 52l-107 82-31 20Z"
          fill="var(--color-text)"
        />
        <path
          d="M388 393c-5-22 6-40 24-49l98-50c20-10 42 0 50 21 8 21-2 41-21 50l-91 45-28 16Z"
          fill="var(--color-text)"
        />

        <path
          d="M88 405c54-18 99-50 140-94 18-20 36-44 57-67 22-24 52-37 81-30 33 7 54 31 60 61 5 26-6 55-25 77-16 19-31 34-48 50-23 21-47 42-81 61-39 23-78 39-124 53l-54 14Z"
          fill="var(--color-text)"
        />
        <path
          d="M242 424c10-41 38-71 74-78 29-6 55 6 80 28l77 60c17 13 19 38 5 55-14 17-39 20-57 7l-73-53c-13-9-25-10-37-2l-26 18c-15 10-35 7-46-6-9-11-9-21 3-29Z"
          fill="var(--color-text)"
        />

        <path d="m297 247 43 31m13-5 43 30m12 1 40 27" fill="none" />
        <path d="M286 390c22-14 47-16 70-5m-89 46c19-5 38-3 55 7" fill="none" />
        <path d="M428 111c14-4 28 0 38 11m50 36c13-2 26 4 34 15m13 54c13 1 25 8 31 19m-26 40c12 4 22 12 27 23" fill="none" />
      </g>
    </svg>
  );
}

export function RightHandArt({ className, style }: ArtProps) {
  return (
    <svg
      viewBox="0 0 720 560"
      className={className}
      style={style}
      role="img"
      aria-label="Illustrated right hand open to receive a note"
      focusable="false"
    >
      <g stroke={outline} strokeWidth="8" strokeLinecap="round" strokeLinejoin="round">
        <path d="M566 320 720 280v280l-181-25Z" fill="var(--color-text)" />
        <path d="m593 318 14 198m48-212 12 203m48-216 8 207" fill="none" />
        <path d="M568 326h92v47h-92Z" fill="var(--color-muted)" />

        <path
          d="M570 339c-50 7-95 0-133-21-36-20-64-49-78-82-10-24-4-47 13-62 18-16 44-16 62 0l42 38c18 16 34 19 48 11 17-9 36-6 50 7 13 13 16 33 8 50l-18 38c-7 14-3 24 14 28Z"
          fill="var(--color-muted)"
        />

        <path
          d="M410 242c-37-10-76-30-117-58L139 76c-20-14-25-41-11-61 15-21 43-26 64-12l169 108c25 16 50 28 75 34l19 4Z"
          fill="var(--color-muted)"
        />
        <path
          d="M382 286c-40-4-81-17-125-40L95 148c-22-12-31-38-20-60 11-23 38-33 61-22l188 88c28 13 54 20 80 22l18 1Z"
          fill="var(--color-muted)"
        />
        <path
          d="M370 334c-39 4-81-1-126-17L87 254c-24-9-37-34-29-58 8-24 33-38 57-31l196 59c28 8 54 10 80 7l17-2Z"
          fill="var(--color-muted)"
        />
        <path
          d="M383 386c-37 12-77 16-121 10l-165-23c-25-4-43-26-41-51 3-25 24-44 50-43l190 10c29 1 55-3 79-14l16-7Z"
          fill="var(--color-muted)"
        />

        <path
          d="M526 345c-27-20-53-31-78-30-27 1-47 16-57 39-11 25-7 53 12 72l64 64c15 15 39 15 54 0 15-15 15-39 0-54l-38-39c-10-10-8-21 5-28 16-9 30-17 38-24Z"
          fill="var(--color-muted)"
        />

        <path d="m174 88 28 20m-72 63 29 14m-38 103 30 8m29 98 32 3" fill="none" />
        <path d="M407 206c21 3 39 11 54 23m-77 18c19 3 37 9 52 18m-50 31c18 0 35 3 51 9" fill="none" />
        <path d="M449 442c14 10 29 15 45 14m-27 22c11 6 22 8 34 7" fill="none" />
      </g>
    </svg>
  );
}

export function NoteArt({ className, style }: ArtProps) {
  return (
    <svg
      viewBox="0 0 320 190"
      className={className}
      style={style}
      role="img"
      aria-label="Illustrated lime rupee note"
      focusable="false"
    >
      <g stroke={outline} strokeWidth="8" strokeLinecap="round" strokeLinejoin="round">
        <rect
          x="8"
          y="8"
          width="304"
          height="174"
          rx="24"
          fill="var(--color-accent)"
        />
        <path d="M34 49h43M34 141h43M243 49h43M243 141h43" fill="none" />
        <path d="M48 72v46m224-46v46" fill="none" opacity="0.72" />
        <circle cx="160" cy="95" r="45" fill="none" />
        <text
          x="160"
          y="121"
          fill="var(--color-ink)"
          stroke="none"
          fontFamily="var(--font-mono), ui-monospace, monospace"
          fontSize="70"
          fontWeight="700"
          textAnchor="middle"
        >
          ₹
        </text>
        <path d="m35 26 10 10m-10 128 10-10m240-118-10 10m10 118-10-10" fill="none" />
      </g>
    </svg>
  );
}
