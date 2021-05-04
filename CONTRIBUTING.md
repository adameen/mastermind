# Contribution guide for developers

## Git Workflow

Here you need to specify flow you are using in this app/library. So that all developers use the same set of rules.

Example:

> Development branch: `develop`
> Feature branch naming convention: `feature/JIRA_ISSUE_ID`
> Bug branch naming convention: `bug/JIRA_ISSUE_ID`
> Release branch: `release/X.Y.Z`

## Code review

Here you need to specify app/library code review process, rules and what templates to use.

Example:

> To unify code review process, the template `etn_merge` should be used for every merge request.
>
> Always make sure to include a brief description and/or a link to Jira issue, testing prerequisites, edge cases that have to be tested and which parts of application were modified by the merge request.


## How to test

Here you need to write down procedures for testing that are used in this app/lib.

### Unit testing

How to run, write or validate results of app/lib unit tests.

### UI testing [OPTIONAL]

How to run, write or validate results of app/lib UI tests.

## How to distribute

Here you write down distribution guide for contributing developers. They should be able to finish app/lib distribution with this description only (if they have permissions).

### CI (Continuous Integration)

Here you should specify how CI works and describe configured processes. You should also describe how, when and where the app/lib should be delivered (AppStore/AppCenter/...).

## Style/Code guides [OPTIONAL]

In this section you should write all the needed information on **style** (colors, fonts, graphical assets, etc.) or **code** (linting, adding/removing parts of code, etc.)  **rules** that are mandatory for all contributors.

## Localization [OPTIONAL]

Here you should write down description of rules adding new localization terms to the project. If your project has only one language then you can skip this section.

## Contacts

Here you should write down contact on project lead/support developer, so all the unclear rules can be sorted out.