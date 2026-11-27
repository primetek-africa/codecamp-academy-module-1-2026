# Sprint Closing Ceremony: Sprint Review and Retrospective

**Program:** Advanced Full-Stack Software Development  
**Organization:** PrimeTek Africa - Codecamp Academy  
**Module:** Capstone Project Development  
**Instructor:** Cristian Camilo Cortes Ortiz  
**Activity:** Sprint Closing Ceremony and Sprint 03 Preparation

---

## 1. Introduction

The purpose of this activity is to formally conclude Sprint 02,
evaluate the team's performance, document the results, and identify
opportunities for improvement.

Throughout this activity, you will work with your GitHub repository,
GitHub Projects, and ChatGPT to analyze your development progress and
generate the corresponding engineering management documentation.

The activity consists of the following stages:

1. Analyze the backlog and evaluate Sprint 02 performance.
2. Create and close the Sprint 02 GitHub milestone.
3. Generate the Sprint Review documentation.
4. Generate the Sprint Retrospective documentation.
5. Prepare Sprint 03 planning and create the corresponding issues.

## 2. Analyze the Sprint Backlog

Before closing the sprint, review all the issues associated with
your current sprint.

The objective is to evaluate your actual performance and identify
which activities were completed, which remain pending, and whether
the sprint objectives were achieved.

Open your GitHub repository and review the issues using the following
filter:

```text
is:issue created:2026-11-23..2026-11-27
```

**Important:** This filter identifies issues created during the
specified period. It does not necessarily identify every issue
belonging to the sprint.

Review the issues assigned to your sprint and discuss the following:

- Which issues were successfully completed?
- Which issues remain open or unfinished?
- Did you accomplish your sprint objectives?
- Were your original time estimates realistic?
- What difficulties affected your development process?
- What improvements could be implemented in the next sprint?

This discussion will provide the foundation for your Sprint Review
and Sprint Retrospective.

## 3. Create and Close the Sprint Milestone

Once you have reviewed your backlog, formalize the conclusion of
Sprint 02 using GitHub Milestones.

Navigate to your repository:

https://github.com/primetek-africa/codecamp-academy-module-1-2026

Open the **Issues** section and navigate to **Milestones**.

Create a milestone using the following naming convention:

```text
Sprint 02 - [Start Date] to [End Date]
```

Configure the milestone with the appropriate description and
completion date.

For example:

```text
Sprint 02 - November 23 to November 27, 2026
```

### 3.1 Associate the Sprint Issues

Once the milestone has been created, associate all issues belonging
to Sprint 02 with the corresponding milestone.

You can use GitHub's issue filters to locate and organize the
relevant issues.

Make sure that:

- All issues belonging to the sprint are associated with the
  milestone.
- Completed issues are correctly marked as closed.
- Unfinished issues remain open.
- Pending work is identified for consideration in Sprint 03.

### 3.2 Close the Milestone

After reviewing the issues and confirming the sprint's final state,
close the milestone.

This formally records the conclusion of Sprint 02 in GitHub.

**Important:** Closing a milestone does not automatically mean
that every issue was completed. The actual status of each issue
must accurately reflect the work performed.

## 4. Generate the Sprint Review Documentation

The Sprint Review is an evaluation of the work completed during
the sprint.

Its purpose is to communicate the development progress, demonstrate
the implemented functionality, review the sprint objectives, and
identify outstanding work.

For this activity, you will use the Sprint Review template provided
in the course repository.

### 4.1 Locate the Documentation Templates

Navigate to the following repository:

https://github.com/primetek-africa/codecamp-academy-module-1-2026/tree/main/capstone-project-resources/managements/sprint-planning/acts

Review the available templates before generating your documentation.

The project documentation should follow this structure:

```text
docs/
└── management/
    └── records/
        └── sprints/
            ├── sprint-01/
            │   ├── ACT-SP-001-sprint-01-planning.md
            │   ├── ACT-SR-001-sprint-01-review.md
            │   └── ACT-RET-001-sprint-01-retrospective.md
            │
            ├── sprint-02/
            │   ├── ACT-SP-002-sprint-02-planning.md
            │   ├── ACT-SR-002-sprint-02-review.md
            │   └── ACT-RET-002-sprint-02-retrospective.md
            │
            └── ...
```

Each sprint must have its own documentation directory.

### 4.2 Connect GitHub to ChatGPT

To allow ChatGPT to analyze your actual project information,
connect your GitHub account to ChatGPT.

Follow these steps:

1. Open ChatGPT.
2. Navigate to Settings.
3. Open the Apps or Plugins section, depending on your interface.
4. Search for the GitHub integration.
5. Connect your GitHub account.
6. Authorize access to the repositories you want ChatGPT to analyze.

Make sure that ChatGPT has access to your capstone project repository.

The purpose of this integration is to allow ChatGPT to retrieve
relevant project information instead of relying exclusively on
information manually provided in the conversation.

### 4.3 Generate the Sprint Review Using AI

Once GitHub is connected, provide ChatGPT with the Sprint Review
template and the following reusable prompt.

Replace the student information and sprint details with your own
information.

#### Reusable Sprint Review Prompt

```text
I need you to analyze my GitHub project and repository for my
capstone project and generate the Sprint Review documentation.

PROJECT INFORMATION:

- Project name: [PROJECT NAME]
- Project repository: [GITHUB REPOSITORY]
- GitHub username: [GITHUB USERNAME]
- Scrum Master: [SCRUM MASTER NAME]
- Project Owner: [PROJECT OWNER OR NONE]
- Project Reviewer: [INSTRUCTOR NAME]
- Instructor GitHub: [INSTRUCTOR USERNAME]
- Sprint number: [SPRINT NUMBER]
- Sprint start date: [START DATE]
- Sprint end date: [END DATE]

TEAM INFORMATION:

- Team members: [TEAM MEMBERS]
- Development responsibilities: [RESPONSIBILITIES]
- Stakeholders: [STAKEHOLDERS OR NONE]
- Meetings: Remote or in-person, according to the actual project.

TASK:

Analyze the actual state of my GitHub repository, including:

1. Issues created during the sprint.
2. Issues assigned to the sprint milestone.
3. Closed and open issues.
4. Pull requests and merged contributions.
5. Commits and development activity.
6. Project documentation and implemented functionality.
7. Progress against the sprint objectives.

I will provide the official Sprint Review template.
Use its structure and preserve its original sections.

DOCUMENTATION REQUIREMENTS:

- Complete the template using evidence from my repository.
- Evaluate the actual sprint performance.
- Identify completed and unfinished objectives.
- Describe the work delivered during the sprint.
- Identify relevant challenges and outstanding tasks.
- Include participants and meeting information accurately.
- Do not invent stakeholders, meetings, features, or results.
- Do not assume that an issue was completed just because it
  was created or assigned to a milestone.
- If information cannot be verified, explicitly identify it
  as unavailable instead of making assumptions.
- Keep the writing professional and suitable for academic
  software engineering documentation.
- Preserve the original template structure.
- Do not include sections explicitly excluded by my instructor.

OUTPUT:

Generate the complete Markdown document.

Use this filename:

ACT-SR-[NUMBER]-sprint-[SPRINT NUMBER]-review.md

The document must reflect the real state of my project,
not an idealized or hypothetical sprint.
```

**Important:** Attach or provide the official Sprint Review template
when using this prompt. The AI must use the actual template rather
than inventing a new document structure.

### 4.4 Review and Save the Document

Once ChatGPT generates the Sprint Review:

1. Read the entire document.
2. Verify that the reported activities match your repository.
3. Correct any inaccurate or incomplete information.
4. Verify the sprint dates and participants.
5. Save the document inside the corresponding sprint directory.

Example:

```text
docs/management/records/sprints/sprint-02/
└── ACT-SR-002-sprint-02-review.md
```

Do not submit AI-generated documentation without reviewing
its accuracy.

## 5. Generate the Sprint Retrospective Documentation

After completing the Sprint Review, the next step is the
Sprint Retrospective.

While the Sprint Review focuses on the work delivered, the
Sprint Retrospective focuses on the team's development process
and identifies opportunities for improvement.

You must reflect on your experience throughout the sprint.

Consider the following aspects:

- What worked well during the sprint?
- What did not work as expected?
- What difficulties did you encounter?
- Were your estimates realistic?
- How effective was communication?
- What technical skills should you improve?
- What actions can improve your next sprint?

### 5.1 Generate the Retrospective Using AI

Provide ChatGPT with the official Sprint Retrospective template
and use the following reusable prompt.

#### Reusable Sprint Retrospective Prompt

```text
I need you to analyze my GitHub project and generate the
Sprint Retrospective documentation for my capstone project.

PROJECT INFORMATION:

- Project name: [PROJECT NAME]
- GitHub repository: [GITHUB REPOSITORY]
- GitHub username: [GITHUB USERNAME]
- Scrum Master: [SCRUM MASTER NAME]
- Sprint number: [SPRINT NUMBER]
- Sprint start date: [START DATE]
- Sprint end date: [END DATE]

TASK:

Analyze my project context, repository activity, sprint issues,
documentation, and the Sprint Review.

I will provide the official Sprint Retrospective template.

Use the template to generate a professional retrospective
based on the actual project context.

IMPORTANT:

The retrospective must reflect my personal experience and
the real development process.

Analyze the repository to identify technical challenges,
completed work, pending activities, and possible improvements.

However, do not invent personal experiences, opinions,
communication problems, or difficulties that cannot be
verified from the available information.

Use the following information as my personal reflection:

[DESCRIBE YOUR EXPERIENCE DURING THE SPRINT]

Include the following aspects:

1. What worked well.
2. What did not work well.
3. Difficulties and challenges.
4. Time estimation and task management.
5. Communication and collaboration.
6. Lessons learned.
7. Improvement actions for the next sprint.

DOCUMENTATION REQUIREMENTS:

- Preserve the original template structure.
- Use my personal reflection as the primary source for
  subjective experiences.
- Use repository evidence to support technical observations.
- Do not copy personal experiences from other students.
- Do not introduce hypothetical problems.
- Write in professional academic English.
- Provide realistic and actionable improvement actions.
- Connect the proposed improvements with Sprint 03.

OUTPUT:

Generate the complete Markdown document.

Use this filename:

ACT-RET-[NUMBER]-sprint-[SPRINT NUMBER]-retrospective.md
```

### 5.2 Review and Save the Document

After generating the retrospective:

1. Read the document carefully.
2. Verify that the retrospective reflects your actual experience.
3. Ensure that improvement actions are realistic.
4. Verify that the proposed improvements can be implemented
   during the next sprint.
5. Save the document in the corresponding sprint directory.

Example:

```text
docs/management/records/sprints/sprint-02/
└── ACT-RET-002-sprint-02-retrospective.md
```

Remember that the retrospective is a personal and professional
reflection. AI can help organize and document your thoughts,
but you are responsible for providing accurate information
about your experience.

## 6. Prepare Sprint 03 Planning

Once the Sprint Review and Sprint Retrospective are completed,
you can begin preparing the next sprint.

Unlike the previous documentation activities, Sprint 03 planning
must be performed by you, based on your project's actual priorities.

The objective is to translate the improvement actions and
outstanding work identified in Sprint 02 into actionable tasks.

### 6.1 Review Pending Issues

Before creating new issues, review:

- Unfinished activities from Sprint 02.
- Bugs or technical problems.
- Features that require additional implementation.
- Improvement actions from the retrospective.
- New requirements and project priorities.

Do not automatically transfer every unfinished issue into
Sprint 03. Evaluate its relevance and priority first.

### 6.2 Create the Sprint 03 Milestone

Navigate to your repository's GitHub Milestones section.

Create the next milestone using the same naming convention:

```text
Sprint 03 - [Start Date] to [End Date]
```

Remember that our sprint duration is one working week:

- Start: Monday.
- End: Friday.

### 6.3 Create Sprint 03 Issues

Create the issues required to accomplish your next sprint objectives.

Every issue should contain:

- A clear and descriptive title.
- A detailed description.
- The expected outcome.
- Acceptance criteria.
- Relevant technical considerations.
- Priority.
- Assignee.
- Associated milestone.

Break large activities into smaller, manageable tasks.

Avoid creating vague issues such as:

```text
Improve backend
Work on frontend
Fix project
```

Instead, create specific and actionable issues, for example:

```text
Implement user registration endpoint
Create authentication form validation
Configure PostgreSQL database migrations
Implement integration tests for authentication
```

These are illustrative examples. Your actual issues must reflect
your project's requirements and development priorities.

### 6.4 Organize Your Sprint Backlog

Once all issues have been created:

1. Assign the issues to the Sprint 03 milestone.
2. Configure their priorities.
3. Assign responsibilities.
4. Review task dependencies.
5. Estimate the effort required.
6. Organize the issues in GitHub Projects.
7. Confirm that the sprint workload is realistic.

Your Sprint 03 planning document must be saved using the
established naming convention:

```text
ACT-SP-003-sprint-03-planning.md
```

The final documentation structure should look like this:

```text
docs/
└── management/
    └── records/
        └── sprints/
            └── sprint-02/
                ├── ACT-SP-002-sprint-02-planning.md
                ├── ACT-SR-002-sprint-02-review.md
                └── ACT-RET-002-sprint-02-retrospective.md
```

The next sprint will have its own directory and documentation.

---

## 7. Final Checklist

Before considering this activity completed, verify the following:

### Sprint 02 Closing

- [ ] Reviewed all Sprint 02 backlog issues.
- [ ] Evaluated completed and unfinished activities.
- [ ] Created the Sprint 02 GitHub milestone.
- [ ] Associated the corresponding issues with the milestone.
- [ ] Verified the status of every issue.
- [ ] Closed the Sprint 02 milestone.

### Sprint Documentation

- [ ] Generated the Sprint Review using the official template.
- [ ] Reviewed and corrected the generated document.
- [ ] Generated the Sprint Retrospective using the official template.
- [ ] Reviewed and corrected the generated document.
- [ ] Saved both documents in the correct directory.
- [ ] Verified that the documentation reflects the actual project.

### Sprint 03 Preparation

- [ ] Reviewed outstanding tasks and improvement actions.
- [ ] Defined the Sprint 03 objectives.
- [ ] Created the Sprint 03 milestone.
- [ ] Created the required GitHub issues.
- [ ] Associated the issues with the new milestone.
- [ ] Organized the Sprint 03 backlog.
- [ ] Completed the Sprint 03 planning document.

---

## 8. Learning Objectives

By completing this activity, you should be able to:

1. Evaluate software development performance using actual
   project management information.
2. Manage sprint milestones and issues using GitHub.
3. Understand the difference between a Sprint Review and
   a Sprint Retrospective.
4. Produce formal engineering management documentation.
5. Use AI tools to analyze software repositories and
   support documentation activities.
6. Identify opportunities for continuous improvement.
7. Plan and organize development activities for a new sprint.

## 9. Final Instructions

Remember that Agile methodologies are not only about developing
software. They also involve planning, communication, evaluation,
documentation, and continuous improvement.

Your GitHub repository must reflect the actual development
process of your capstone project.

Complete the Sprint 02 closing activities and prepare your
Sprint 03 backlog independently.

Your next development cycle should incorporate the lessons
learned from the previous sprint.

**The objective is not simply to close a sprint. It is to
continuously improve the way you plan, develop, and manage
software projects.**