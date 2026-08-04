Plant Stories Zürich — shared class version

Includes:
- “Noticed on …” date on every entry
- public read-only map
- local drafts without student accounts
- picture upload and student submission
- private teacher moderation
- approve, return, edit and delete
- corrected Lachenzelg ivy model text

To activate shared submissions:
1. Create a free Supabase project.
2. In SQL Editor, replace REPLACE_WITH_YOUR_TEACHER_EMAIL in setup.sql and run it.
3. In Storage, create a PUBLIC bucket named plant-images.
4. In Authentication > Users, create your teacher login.
5. In Project Settings > API, copy the Project URL and anon key into config.js.
6. Upload all updated files to the root of your GitHub repository.
7. Vercel will redeploy automatically.
