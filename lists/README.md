# ColdFusion List Functions Demonstration Site

A comprehensive demonstration site showcasing all built-in ColdFusion list functions with practical, real-world examples written in modern CF Script.

## Overview

This project demonstrates 26 ColdFusion list functions through interactive examples that show both the code and its execution. Each function page includes:

- **Description**: What the function does and when to use it
- **Syntax**: The function signature with parameters
- **Examples**: Multiple practical examples from basic to advanced
- **Real-world scenarios**: Business applications and use cases

## Functions Covered

### List Creation & Modification
- `ListAppend` - Adds an element to the end of a list
- `ListPrepend` - Adds an element to the beginning of a list
- `ListInsertAt` - Inserts an element at a specific position
- `ListDeleteAt` - Removes an element at a specific position
- `ListSetAt` - Replaces an element at a specific position
- `ListChangeDelims` - Changes the delimiter of a list

### List Retrieval & Access
- `ListFirst` - Returns the first element of a list
- `ListLast` - Returns the last element of a list
- `ListGetAt` - Returns an element at a specific position
- `ListRest` - Returns all elements except the first
- `ListLen` - Returns the number of elements in a list

### List Search & Filter
- `ListFind` - Finds the position of an element (case-sensitive)
- `ListFindNoCase` - Finds the position of an element (case-insensitive)
- `ListContains` - Checks if a list contains a substring (case-sensitive)
- `ListContainsNoCase` - Checks if a list contains a substring (case-insensitive)
- `ListFilter` - Filters list elements based on a callback function
- `ListRemoveDuplicates` - Removes duplicate elements from a list

### List Transformation
- `ListMap` - Transforms each element using a callback function
- `ListReduce` - Reduces a list to a single value using a callback function
- `ListSort` - Sorts a list in ascending or descending order
- `ListToArray` - Converts a list to an array
- `ListQualify` - Adds qualifiers around list elements

### List Analysis
- `ListValueCount` - Counts occurrences of a value (case-sensitive)
- `ListValueCountNoCase` - Counts occurrences of a value (case-insensitive)

### List Replacement
- `ReplaceList` - Replaces values in a string using lists (case-sensitive)
- `ReplaceListNoCase` - Replaces values in a string using lists (case-insensitive)

## Project Structure

```
lists/
├── index.cfm              # Main navigation page
├── styles.css             # Shared CSS styles
├── README.md              # This file
├── listappend.cfm         # ListAppend function demo
├── listfind.cfm           # ListFind function demo
├── listmap.cfm            # ListMap function demo
├── listsort.cfm           # ListSort function demo
├── listfilter.cfm         # ListFilter function demo
├── listlen.cfm            # ListLen function demo
├── listtoarray.cfm        # ListToArray function demo
└── [additional function files...]
```

## Features

### Modern Design
- Responsive layout that works on desktop and mobile
- Clean, professional styling with CSS Grid and Flexbox
- Smooth hover effects and transitions
- Color-coded sections for easy navigation

### Interactive Examples
- **Code Display**: Syntax-highlighted code samples
- **Live Execution**: Code that actually runs and shows output
- **Real-world Scenarios**: Practical business applications
- **Multiple Examples**: From basic to advanced usage

### Educational Value
- Clear explanations of when to use each function
- Progressive complexity in examples
- Common use cases and best practices
- Error handling and validation examples

## Getting Started

### Prerequisites
- Adobe ColdFusion (2021 or later recommended)
- Web server with ColdFusion support

### Installation
1. Download or clone this repository
2. Place the files in your ColdFusion web root directory
3. Access `index.cfm` through your web browser
4. Navigate through the functions using the main page

### Usage
1. **Browse Functions**: Use the main page to explore different function categories
2. **Study Examples**: Each function page shows multiple examples with explanations
3. **Run Code**: The examples execute live, showing actual output
4. **Copy Code**: Use the code samples in your own projects

## Example Use Cases

### E-commerce Applications
- Shopping cart management with `ListAppend` and `ListLen`
- Product filtering with `ListFilter`
- Price calculations with `ListMap`
- Inventory tracking with `ListValueCount`

### User Management Systems
- Permission validation with `ListFind` and `ListContains`
- Role-based access control with `ListFilter`
- User session management with `ListToArray`
- Group management with `ListRemoveDuplicates`

### Data Processing
- CSV data parsing with `ListToArray`
- Form data validation with `ListFilter`
- Configuration file processing with `ListMap`
- Report generation with `ListSort`

### File Management
- File extension validation with `ListFind`
- Directory listing with `ListSort`
- File type filtering with `ListFilter`
- Path processing with `ListMap`

## Code Standards

### Modern CF Script
All examples use modern Adobe ColdFusion script syntax:
- Function-based approach
- Arrow functions and closures
- Modern variable scoping
- Error handling best practices

### Best Practices
- Input validation and sanitization
- Error handling and user feedback
- Performance considerations
- Security best practices

## Browser Compatibility

- Chrome 60+
- Firefox 55+
- Safari 12+
- Edge 79+
- Mobile browsers (iOS Safari, Chrome Mobile)

## Contributing

To add new examples or improve existing ones:

1. Follow the existing code structure and styling
2. Include both basic and advanced examples
3. Provide real-world use cases
4. Test all code examples thoroughly
5. Update the README if adding new functions

## License

This project is open source and available under the MIT License.

## Support

For questions or issues:
- Check the function documentation on each page
- Review the code examples for implementation details
- Refer to Adobe ColdFusion documentation for additional information

---

**Built with Adobe ColdFusion - Modern CF Script Examples** 