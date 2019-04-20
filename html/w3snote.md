# HTML Tutorial

## Talbe of Contents

<!-- TOC -->

- [HTML Tutorial](#html-tutorial)
    - [Talbe of Contents](#talbe-of-contents)
    - [Structure](#structure)
        - [HTML document](#html-document)
        - [HTML elements](#html-elements)
    - [Conventions](#conventions)
        - [Naming Conventions](#naming-conventions)
        - [Best Practices](#best-practices)

<!-- /TOC -->

## Structure

### HTML document

1. Document type declaration: `<!DOCTYPE html>`
1. The `<html>` element defines the whole document.
1. Only the content inside the `<body>` section (the white area above) is displayed in a browser.

```html
<!DOCTYPE html>
<html>
<body>

<h1>My First Heading</h1>
<h2>My sub Heading</h2>
<p>My first paragraph.</p>

</body>
</html>
```

### HTML elements

1. Contents
    - Headings: `<h1>` to `<h6>` with decreasing significance.
    - Paragraphs: `<p>`
    - Links: `<a>`
    - Images: `<img>`

1. Objects
    - Button: `<button>`
    - Lists: 
        - unordered: `<ul>`
        - ordered: `<ol>`

        ```html
        <ul>
        <li>Coffee</li>
        <li>Tea</li>
        <li>Milk</li>
        </ul>
        ```

1. Empty elements: `<element />`
    - Line break: `<br />`

## Conventions

### Naming Conventions

1. Using lowercase tags.

### Best Practices

1. Always using End Tags.