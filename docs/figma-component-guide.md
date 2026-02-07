---
title: "Figma Component Building Guide"
author: "Arnesh Mandal"
version: "1.2"
date: "2026-02-06"
include-before: |
  \begin{lstlisting}[style=coverasciiart]
             +---------+     +---------+     +---------+
             |   [ ]   |     |   [ ]   |     |   [ ]   |
             |    |    | --> |    |    | --> |    |    |
             |  __|__  |     |  __|__  |     |  __|__  |
             +---------+     +---------+     +---------+
                PLAN            BUILD         VALIDATE

      Build responsive, maintainable, production-ready components
  \end{lstlisting}
---

# Figma Component Building Guide

## Goals

This guide ensures Figma components are built to be responsive, maintainable, and production-ready.

- **Responsive by default** — Components self-adapt to any screen size without manual intervention
- **Token-driven** — All design properties (color, spacing, type, size) controlled via variables for single-point updates and dev handoff
- **Platform-agnostic** — Mobile ↔ Desktop switching via modes, not duplication
- **Self-documenting** — Naming, structure, and hierarchy make usage obvious to designers, developers, and AI
- **Code-mirrored** — Component architecture matches how it would be built in code

## Stage 1: Pre-Build

### Define Intent

Before touching Figma, answer these foundational questions to establish clear requirements and avoid rebuilding later.
These questions force you to think through edge cases, platform differences, and technical constraints before committing to a structure.

- What happens when width reduces?
- What happens when text exceeds X lines?
- How does it behave in vernacular/RTL?
- How does mobile differ from desktop?
- Will this be fill-width or fixed-width in use?
- Does it need variants?
- What's the shape of this component across situations, platforms, languages?

### Starting Point Strategy

When fixing an existing component, begin by auditing and correcting auto-layout and constraints.
This establishes the responsive foundation before adding new features.

When creating a new component, start from the smallest element and work upward.
Build icons first, then combine into containers, then assemble into full components.
This bottom-up approach ensures each piece is properly constrained before being nested.

## Stage 2: Build

### Setup

#### Variables and Modes Configuration

Create or identify the variables needed for your component including color, spacing, type, and size.
Define the scope for each variable to control where it can be applied (for example, color variables might be scoped to fills only or strokes only).
Set up a `device` variable with two modes: `mobile` and `desktop`.
This single variable controls platform-specific behavior across the entire design system.

#### Property and Variable Naming Parity

Property names must match variable names exactly across all components.
For example, a property named `device` with values `mobile` and `desktop` must correspond to a variable named `device` with modes `mobile` and `desktop`.
Use identical naming conventions everywhere with no variations like `Device`, `DEVICE`, or `device-type`.
This consistency enables proper mode binding and makes the system AI-parseable.

#### Master Component Wrapper Decision

Choose the appropriate wrapper structure for your main component based on production usage.

| If... | Then... |
|-------|---------|
| Component will be fill-width in production | Wrap master in fixed-width auto-layout, set master to fill |
| Component has variants | Put master inside grid auto-layout |
| Both | Grid auto-layout wrapper with fixed width, master fills |
: Master component wrapper guidelines

#### Variant vs. New Component Decision

Determine whether to add a variant or create a separate component.

| Scenario | Action |
|----------|--------|
| Differences can be toggled (show/hide, on/off) | Create boolean property |
| Differences are states (hover, pressed, disabled, focus) | Create variant property |
| Fundamentally different structure or purpose | Create new component |
: Variant creation guidelines

### Elements (Smallest First)

#### Icons

- Start with outline stroke to define the icon shape
- Press `Cmd+E` to flatten the strokes into a single vector object
- Set a fixed ratio to maintain proportions during resize
- Apply constraints to keep the icon proportionate within its parent container

#### Images

- Use images as a fill layer inside a container frame rather than as standalone layers
- Set the container to fixed ratio plus fill width, which maintains aspect ratio while allowing horizontal scaling
- Apply constraints to control how the container behaves when the parent resizes

#### Swappable Icons

- Set up instance swap properties for components that include interchangeable icons
- Populate the swap list with preferred or suggested icons to guide users toward appropriate choices
- This makes icon replacement discoverable without requiring users to search the entire icon library

#### Naming Conventions

- Apply naming conventions consistently as you build
- Use all lowercase with no spaces for variables, main components, instances, folders, and properties
- Name layers based on their purpose rather than accepting default names like "Frame 47"
- Descriptive names make the structure self-documenting and improve code handoff quality

### Assembly (Auto-Layout)

#### Default Sizing Rules

Apply these sizing defaults unless specific requirements dictate otherwise.

| Scenario | Width | Height |
|----------|-------|--------|
| Default | Fill | Hug |
| Paired items in list | One fills, one hugs | — |
| Equal-space siblings | All fill | — |
| Fixed | Only when absolutely necessary | — |
: Auto-layout sizing defaults

#### Grid Auto-Layout

- Use grid auto-layout (auto-layout with wrap enabled) for ratio-based resizing where items should flow into multiple rows or columns
- Use it for main components that will be fill-width in production, as it prevents distortion
- Use it to retain proper variant behavior when switching between variants with different content amounts
- Avoid grid auto-layout for simple single-direction layouts where standard auto-layout suffices

#### Text

- When using hug for text containers, set truncation and max height to prevent unbounded growth
- Never mix two different text styles within the same container as this causes unpredictable behavior during resize and when changing languages

#### Carousels

- Fix aspect ratios on carousel items to ensure item count stays consistent during resize
- Each carousel item should have height set to fill with a fixed ratio applied
- This maintains visual consistency across different viewport widths

#### Complex Patterns

- For complex patterns like label-value pairs with icons, use grid auto-layout
- Set the value element to hug so it shrinks to fit the content
- Set the label element to fill so it takes remaining space
- Set icons to fixed ratio to maintain their proportions
- This creates a flexible layout that adapts to different content lengths

### Adaptability (Device Modes)

#### Mode Assignment

Assign device modes based on your component structure.

| Scenario | Action |
|----|----|
| Desktop is a variant | Set variable mode `device = desktop` on that variant |
| Component morphs to desktop | Set property `device = mobile` on nested parts |
| Mobile part used inside desktop variant | Override that part's mode to desktop |
: Mode assignment guidelines

#### Cross-Device Component Setup

- Add a `device` property to the component properties with values `mobile` and `desktop`
- Remove any hardcoded device mode from the component itself
- Set the component to fill width to allow it to adapt to different screen sizes
- Customize the content for each device context
- Ensure the parent screen has its mode set to either `device = mobile` or `device = desktop`

#### Using Device-Adaptive Components

- Set the screen (root frame) mode to `device = mobile` or `device = desktop` before adding component instances
- Add the component instance to the screen
- In the component's `device` property, switch from the hardcoded value to the variable `device`
- The component now inherits the device mode from the screen automatically

#### Structure Parity

- Match the auto-layout structure between mobile and desktop variants
- Match the layer order between mobile and desktop variants
- This structural consistency enables smooth mode switching and makes the design system predictable

#### Text Styles and Variables

Configure text handling differently for each platform.

| Platform | Text Styles | Variables |
|----|----|----|
| Mobile | Yes | Yes |
| Desktop | No | Yes (including text) |
: Platform-specific text configuration

Mobile uses text styles for predefined typography scales.
Desktop relies on variables including text variables for more granular control.

### Documentation

#### Component Description

- Fill the description field in every main component with a clear statement of purpose
- Describe the job the component performs rather than specific usage scenarios
- Keep descriptions product-agnostic by avoiding specific product names or use cases
- For example, write "Displays a key-value pair with optional icon" rather than "Shows loan amount on home screen"
- This makes components reusable across different products and contexts

## Stage 3: Polish and Organize

### Naming Audit

- Ensure all names use lowercase with no spaces across the entire file
- Verify layer names describe purpose or use rather than default names
- Apply consistent naming conventions throughout the file
- Confirm property names match exactly across all components (for example, `device` everywhere, never `Device` or `device-type`)
- Make names developer-readable and AI-parseable for code handoff and automated processing
- Optionally order properties logically to improve discoverability

### File Structure

#### Folder Hierarchy Rule

Follow this hierarchy pattern:

```
`Page` > `Root frame/section` (if not component) > `Component name`
```

Using `/` in a component name creates a folder level in the asset panel.
Nested non-component frames do not affect asset panel organization.

#### Organization

Organize assets by type with general assets first and component-specific assets in subfolders.

| Asset Type | Structure |
|------------|-----------|
| Icons | General icons first → Component-specific in sub-folders |
| Parts | General parts first → Component-specific in sub-folders |
| Variants | Same part/icon/component variants → Single folder |
: Asset organization structure

#### Visual Separation

- Use sections and boxes to visually group related assets on the canvas
- Separate component-specific assets from general assets to improve discoverability
- This visual organization makes the file easier to navigate

#### Final Steps

Move finalized components to dedicated pages.
This separates work-in-progress from production-ready components and keeps the file organized.

### Validation

#### Responsiveness

- Resize the screen to verify components reflow correctly at different widths
- Test extreme narrow widths to confirm components behave as intended without breaking

#### Adaptability

- Switch device mode to verify components adapt without breaking layout or hierarchy
- Toggle between mobile and desktop to confirm structure holds across platforms

#### Edge Cases

- Test long text to verify truncation or wrapping behaves correctly
- Remove images to confirm layout remains intact when content is missing
- Test vernacular languages and RTL (right-to-left) to verify international compatibility

#### Discoverability

- Verify components appear in the expected asset panel location
- Confirm folder structure makes intuitive sense to other designers

#### Connections

Test any component connections or interactive links to ensure they function correctly.

## Anti-Patterns

Avoid these common mistakes that break responsive behavior and maintainability.

| Anti-Pattern | Why |
|-----------|----------------------------------------------|
| Fixed width on text containers | Breaks when text length varies, vernacular, or screen resizes |
| Resize components with cursor | Breaks auto-layout and constraints; use properties or frame resize instead |
| Mixed text styles in one container | Causes unpredictable behavior on resize and language change |
| Hardcoded device mode in reusable components | Prevents mode inheritance from parent screen |
| Naming with spaces or caps | Breaks consistency, causes issues in code handoff |
| Detaching instances to "fix" things | Loses connection to main component; request variant instead |
| Using fixed when fill/hug works | Creates rigid components that don't adapt |
: Common anti-patterns to avoid

## Glossary

| Term | Definition |
|-----------|----------------------------------------------|
| **Main component** | The source component (formerly "master"). Changes here propagate to all instances. |
| **Instance** | A linked copy of a main component. Inherits updates from main. |
| **Variant** | A version of a component within the same component set (e.g., state=pressed, size=large). |
| **Variant property** | A property that switches between variants (e.g., `state`, `size`). |
| **Boolean property** | A true/false toggle that shows/hides layers or swaps between two states. |
| **Instance swap property** | A property that allows swapping nested instances (e.g., swapping icons). |
| **Variable** | A reusable value (color, number, string, boolean) that can be applied to properties. |
| **Mode** | A set of variable values that can be switched together (e.g., `device: mobile` vs `device: desktop`). |
| **Scope** | Defines where a variable can be used (e.g., only in fill colors, only in text). |
| **Auto-layout** | Figma's flexbox-like system for responsive spacing and alignment. |
| **Grid auto-layout** | Auto-layout with wrap enabled; items flow into rows/columns like CSS grid. |
| **Constraints** | Rules for how a layer behaves when its parent resizes (left, right, center, scale). |
| **Fill** | Layer expands to fill available space in auto-layout. |
| **Hug** | Layer shrinks to fit its content in auto-layout. |
| **Fixed** | Layer maintains exact pixel size regardless of parent. |
: Figma terminology reference

## Quick Reference Cards

### Sizing Defaults

```
Width: Fill (default)
Height: Hug (default)
Fixed: Only when absolutely necessary
Paired items: One hugs, one fills
Equal items: All fill
```

### Mode Cheatsheet

```
Desktop variant              → Set variable mode device = desktop
Component morphs to desktop  → Set property device = mobile on nested parts
Mobile part in desktop       → Override that part's mode to desktop
Cross-device usage           → Add device property, link to device variable, fill width
```

### Image/Icon Setup

```
Icons:  Outline stroke → Cmd+E → Fixed ratio → Constraints
Images: Fill layer in frame → Fixed ratio → Fill width
```

### When to Use Grid Auto-Layout

```
✓ Ratio-based resizing needed
✓ Master will be fill-width in production
✓ Master has variants
✗ Avoid for simple single-direction layouts
```

### Variant vs. Boolean vs. New Component

```
Boolean property  → Toggle visibility, on/off states
Variant property  → States (hover, pressed, disabled), sizes, types
New component     → Fundamentally different structure or purpose
```

## Library Usage Guide

For designers using components from this library:

### Setup

- Set the screen (root frame) mode to `device = mobile` or `device = desktop` before adding components
- For components with a `device` property, switch the property value to the variable `device` to inherit the screen mode automatically

### Using Components

- Never resize instances with the cursor as this breaks auto-layout
- Instead use frame resize or change properties
- Do not detach instances to fix issues
- Request a variant from the library owner instead
- Override content such as text, images, and icons while preserving the underlying structure
- Use exposed properties only
- If you need functionality that is not exposed, request it from the library owner

### Swapping Content

- For icons, use the instance swap dropdown and select from the suggested icons list
- For images, replace the fill layer while maintaining the aspect ratio
- For text, edit directly and let the component handle overflow through truncation or wrapping

### Responsive Behavior

- Components auto-adapt to container width so allow them to resize naturally
- If something breaks at certain widths, report the issue to the library owner rather than attempting fixes
- Test your screen at multiple widths before handoff to catch responsive issues early

### Don't

- Never detach instances as this breaks the link to the main component
- Never resize components with the cursor as this breaks auto-layout
- Never add fixed widths to text containers as this prevents responsiveness
- Never hardcode device mode when a variable is available as this breaks mode inheritance
- Never rename instance layers as this breaks developer handoff and code mapping
