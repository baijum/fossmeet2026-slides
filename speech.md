# Speech: From Chords to Code

## Title Slide
Hello everyone! I'm Baiju Muthukadan, and today I'm going to share the story of how learning a musical instrument led me to build and ship a mobile app -- with a lot of help from AI tools and the open source community.

## Outline
Here's what we'll cover today. We'll start with how this whole thing began, then walk through the journey from idea to app, the architecture decisions, the challenges of shipping, how FOSS principles shaped the project, and what I learned along the way. We'll also do a live demo towards the end.

---

## About Me
A quick introduction. I've been in the software industry for over 20 years now. I work as a Senior Software Engineer at Red Hat. I've been an active contributor to free and open source software projects for a long time. And more recently, I've been exploring how AI can change the way we build software -- which is very much at the heart of this talk.

## The Spark
So how did this all start? A couple of years ago, I picked up the ukulele. Like most beginners, the first thing I did was look for apps to help me learn. And I found some, but none of them did exactly what I wanted. Around the same time, I was exploring AI-assisted development tools like Claude Code and Cursor. And one day the thought just hit me -- why not build the app myself? So I did. Initially, it was just for me. I had no plans to distribute it. But then I made a post on the ukulele subreddit, and the response surprised me. People were genuinely interested. That community response is what turned a weekend side project into a real one.

---

## The Problem
Let me tell you what was missing. There are plenty of apps out there that show you chord diagrams -- here's how you play a C chord, here's how you play a G chord. But I was curious about something deeper. How are those chords actually found on the fretboard? I wanted a fretboard explorer -- something where I could press on strings, strum, and the app would tell me what chord I'm playing. I wanted to understand the "why" behind chord shapes, not just memorize finger positions.

## Early Prototyping
Before writing any code, I spent a lot of time chatting with AI chatbots -- ChatGPT, Gemini, and others. Not to generate code, but to explore the requirements. What should a fretboard explorer do? How does music theory work? What are the relationships between notes and chords? AI was my brainstorming partner. It helped me think through the problem before I even opened an editor.

## Building with AI Tools
Once I had a clearer picture, I started building. I used Cursor and Claude Code to write the actual app. The process was very iterative -- build a small feature, test it, improve it, move to the next one. AI helped me write code faster, but every decision about what to build and how the app should work -- those were mine. AI-assisted development, but human-driven decisions.

## From Prototype to Production
Pretty soon I had a working app on my phone. But then the question became -- now what? If other people were going to use this, I needed real users to validate and improve it. And that's where I learned something interesting: Google Play requires you to go through closed testing before you can publish. That turned out to be a much bigger challenge than I expected.

---

## The iOS Question
As I was sharing progress on Reddit and Facebook, there was one question that kept coming up: "What about iOS?" People wanted to use the app on their iPhones and iPads. There was just one problem -- I didn't own any Apple device. So I went out and bought an iPad mini, and decided to go cross-platform.

## Choosing the Tech Stack
For the tech stack, I chose Kotlin Multiplatform, or KMP. This let me write the core logic once -- things like domain logic, pitch detection, and chord calculations -- and share it across both platforms. For Android, I used Jetpack Compose with Material3. For iOS, I went with SwiftUI. The UI, audio playback, and storage are all platform-specific, but the brains of the app are shared.

## App Architecture
Here you can see the architecture. At the top, we have the shared KMP module -- this is where all the music theory and chord logic lives. Below that, two platform-specific apps. The Android app uses Compose, ViewModel with StateFlow, SharedPreferences, and SoundPool for audio. The iOS app uses SwiftUI, ObservableObject, UserDefaults, and AVFoundation. Same logic, native experience on each platform.

## UI/UX Decisions
One thing I was very deliberate about was the user experience. Both platforms have a native look and feel because of the technologies we chose. I always preferred platform-native widgets and patterns over trying to make both apps look identical. No pixel-perfect matching. The Android app feels like an Android app, and the iOS app feels like an iOS app. Each platform feels like it belongs there.

---

## Development Workflow
As a solo developer, having a consistent workflow is critical. I used Cursor and Claude Code throughout development. Over time, I created custom Skills in Cursor to automate repetitive tasks -- things like building releases, uploading to the Play Store, adding translations for new languages. I also set up rules for architecture, accessibility, and testing conventions. The result was a consistent, repeatable process that let me move fast without breaking things -- even though I was working alone.

## Reaching Out for Testers
Now, back to the shipping challenge. Google Play requires closed testing, and for that you need testers. I posted on Reddit -- that original post got 3.9 thousand views and 14 comments. I shared in Facebook ukulele groups. I put out a request on my WhatsApp status. I even messaged individual ukulele players on Instagram. Eventually, I got over 30 people to join my Google Group for testing.

## The 14-Day Challenge
But getting people to join was only half the battle. Google requires at least 12 testers to actively use your app for 14 continuous days. I sent emails asking testers to open the app every day. But when I checked the Play Store dashboard, the reality was different -- most of them weren't opening the app regularly. This is a very common struggle for indie developers.

## App Hive to the Rescue
That's when I discovered App Hive. It's a community-driven platform designed exactly for this problem. Developers form groups called "Hives" of about 14 to 20 members. The idea is simple -- you test their apps, and they test yours. There's a proof-of-test system where testers upload screenshots, and only real devices are allowed. After 14 days of continuous testing through App Hive, the requirement was fulfilled. And I finally published the app on Google Play Store.

## User Feedback & Iteration
Once the app was out there, the feedback started flowing in. Early Reddit comments were encouraging -- "practical and beneficial", "looks useful". People requested features like baritone tuning support. One of the first real user reviews said "Works fine on tablet and smartphone!" -- that felt great. I also opened the source code on GitHub, which helped build trust. Each round of feedback shaped the next release.

---

## FOSS Principles in Practice
From the beginning, FOSS principles guided how I built this app. The code is MIT licensed -- fully open source. During development, I followed the classic open source approach: release early, release often. Once the app reached production, I switched to a monthly release cadence, unless there's a critical bug that needs an immediate fix. And I've tried to be transparent about every decision in the development process.

## Community & Sharing
Let me give you a concrete example. We received our first community bug report -- someone found an issue with the auto-scroll feature. I fixed it within 24 hours, publicly credited the reporter, and explained exactly what the root cause was. That one bug report led to new automated tests and improved accessibility checks. I also maintain an ATTRIBUTION.md file that credits every resource used in the app -- audio samples from Freesound, the pitch detection ML model, every library and their licenses. And all discussions happen openly on GitHub for anyone to follow along.

---

## What Worked
Looking back, several things really worked well. AI was a force multiplier -- I used chatbots for brainstorming requirements and Cursor and Claude Code for building. Posting on Reddit early validated the idea before I invested too much. Going cross-platform with KMP was the right call -- shared logic with native UIs. The custom Cursor Skills gave me repeatable workflows that saved a lot of time. App Hive solved the closed testing problem that nearly blocked the whole project. And being transparent and community-focused from day one built trust and brought in valuable feedback.

## What I'd Do Differently
But there are things I'd change if I could start over. First, I'd learn more music theory before building a music app. Understanding the domain deeply matters. Second, I'd start the iOS port earlier -- plan for cross-platform from day one instead of retrofitting it later. And third, I'd give the Circle of Fifths feature more focus sooner. It's one of the most important concepts in music theory, and I should have prioritized it earlier.

---

## Live Demo
Now, let me show you the app in action. I'll run it on the iOS Simulator so you can see how it works.

[DEMO]

---

## Key Takeaways
So, to wrap up. Scratch your own itch -- the best apps come from solving problems you actually have. AI tools lower the barrier -- you don't need a team to ship a real product anymore. Share early and listen actively -- Reddit validated this idea before I over-invested. FOSS principles build trust -- open source your code, give proper attribution, be transparent. The hardest part isn't writing code -- it's distribution, testing, and reaching users. And finally -- start today. Your side project might surprise you.

## Thank You
Thank you so much for listening! The code is fully open source on GitHub. I'd love to hear your questions.
