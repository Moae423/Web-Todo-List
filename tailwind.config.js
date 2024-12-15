/** @type {import('tailwindcss').Config} */
module.exports = {
  content: ["./views/**/*.{html,js,ejs}"],
  theme: {
    extend: {
      fontFamily: {
        JetBrains: ['JetBrains Mono', 'monospace'],
      },
    },
  },
  plugins: [
    require('daisyui'),
  ],
}