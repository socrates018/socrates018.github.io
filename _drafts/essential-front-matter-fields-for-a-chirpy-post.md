---
# --- REQUIRED FIELDS ---

title: "Your Post Title Here"
# The main title of your post, displayed on the page and used for SEO.

date: 2025-07-14
# The publication date of the post in YYYY-MM-DD format.
# Can include time (e.g., 2025-07-14 15:30:00) for more precise sorting.

categories: [Troubleshooting]
# List of categories the post belongs to.
# Used for grouping and category archive pages.
# Use your defined category names here.

tags: [circuits, diy, repair]
# List of tags for more specific classification.
# Tags are often used in tag clouds or tag archive pages.

description: "Short summary or excerpt of your post."
# Used for SEO meta description and previews on index/archive pages.

---

# --- OPTIONAL FIELDS ---

author: johndoe
# Author name or handle.
# Useful if you run a multi-author blog.

image: /assets/images/example.jpg
# Path to a featured image.
# Used in social previews, post headers, or thumbnails.

featured: true
# Mark the post as featured.
# May trigger special display in your theme.

comments: true
# Enable (true) or disable (false) comments on this post.

toc: true
# Show table of contents (TOC) on this post.
# Useful for long articles.

layout: post
# Specify a custom layout if you want to override the default post layout.
# Usually 'post' is default, but you can have others like 'tutorial', 'project', etc.

permalink: /custom-url/
# Custom URL path for the post.
# Useful for SEO-friendly or legacy URLs.

excerpt: "Custom excerpt instead of auto-generated."
# Override the auto-generated excerpt shown on listings or previews.

redirect_from:
# - /old-url/
# Redirect old URLs to this post.
# Handy if you rename or move a post.

math: true
# Enable math rendering (KaTeX or MathJax) for this post.
# Set to true or false.

sticky: true
# Pin this post to the top of post lists.
# Useful for announcements or important posts.

series: "Series Name"
# Group this post into a series.
# Can be used for navigation or filtering.

reading_time: 5
# Estimated reading time in minutes.
# Some themes calculate automatically; you can override.

---

# --- UNUSED OR THEME-SPECIFIC FIELDS (optional) ---

comments_provider: disqus
# Specify comments provider if your theme supports multiple options.

canonical_url: https://your-site.com/post-url/
# Specify canonical URL for SEO if different from permalink.

share: true
# Enable or disable social sharing buttons for this post.

locale: en
# Language locale of the post.

---

# --- NOTES ---

# 1. Categories and tags must be defined in your _config.yml if you want them listed or styled.
# 2. Featured images must be placed inside your assets folder and the path must be correct.
# 3. Some fields like `sticky`, `series`, `math` may require theme support.
# 4. Always check your theme docs for theme-specific front matter options.
# 5. Fields like `redirect_from` require the jekyll-redirect-from plugin.
# 6. Use 'comments: false' to disable comments on a post-by-post basis.
# 7. The `toc` option depends on your theme's support for table of contents.

---

# Start your post content below this line


# Introduction

Write a short introduction or overview here.  
Explain what this post covers.

## Section 1: Diagnosing the Problem

Add detailed content here.  
Use lists, code blocks, images, and anything Markdown supports.

### Example code block

```c
// Sample C code for a circuit test
int voltage = measureVoltage(pin);
if (voltage < threshold) {
    fixComponent();
}
