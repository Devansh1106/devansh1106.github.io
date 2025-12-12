#!/bin/bash

TITLE=$1
SLUG=$(echo "$TITLE" | tr '[:upper:]' '[:lower:]' | tr ' ' '-' | tr -cd '[:alnum:]-')
DATE=$(date +%Y-%m-%d)
BLOG_DIR="docs/blog/posts"

# mkdir -p $POSTS_DIR

cat > $BLOG_DIR/$DATE-$SLUG.md <<EOF
---
title: "$TITLE"
date: $DATE
description: ""
tags: []
---

# $TITLE

Write your content here.
EOF

echo "Created: $BLOG_DIR/$DATE-$SLUG.md"
