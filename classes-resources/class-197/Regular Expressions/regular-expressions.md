# Introduction to Regular Expressions (RegEx)

**Subject:** Programming Fundamentals  
**Topic:** Pattern Matching and Text Validation  
**Programming Language:** JavaScript  
**Level:** Beginner  
**Learning Approach:** Concepts, syntax, examples, and practical exercises

---

## 1. Learning Objectives

By the end of this lesson, students should be able to:

1. Explain what a regular expression is and why it is useful in programming.
2. Understand how regular expressions identify patterns in text.
3. Recognize the most common regular expression symbols and their meanings.
4. Create regular expressions to search for specific characters, words, and numbers.
5. Use character classes, quantifiers, anchors, and groups.
6. Apply regular expressions in JavaScript using `test()`, `exec()`, `match()`, and `replace()`.
7. Build basic validation rules for user input.
8. Identify the limitations of regular expressions and avoid common mistakes.

---

# 2. What Is a Regular Expression?

A **regular expression**, commonly abbreviated as **RegEx** or **regex**, is a 
sequence of characters that defines a search pattern.

This pattern can be used to find, identify, extract, replace, or validate 
specific sequences of characters within text.

In simple terms, a regular expression describes what a piece of text should look like.

For example, imagine that you have the following text:

```text
My name is Michael and I am learning JavaScript.
```

Suppose you want to find the word `Michael`.

You could search for the exact word using a regular expression:

```regex
Michael
```

This pattern matches the sequence of characters `Michael`.

However, regular expressions become more powerful when we want to search for 
patterns instead of specific words.

For example, consider these values:

```text
12345
67890
54321
```

If we want to identify sequences containing only digits, we can use:

```regex
[0-9]+
```

This expression matches one or more consecutive digits.

The same pattern can match different numbers because it describes a rule rather 
than a specific value.

## 2.1 Regular Expressions Are Patterns, Not Programming Languages

A regular expression is not a complete programming language.

It is a specialized tool for describing patterns in text.

JavaScript, Python, Java, and many other programming languages provide regular 
expression functionality, although some syntax and behavior can differ between implementations.

For this lesson, we will use JavaScript's built-in regular expression engine.

## 2.2 Where Are Regular Expressions Used?

Regular expressions are useful in many programming tasks.

Common applications include:

- Searching for words or phrases in documents.
- Checking whether a string contains only numbers.
- Validating the basic structure of an email address.
- Checking the format of a username.
- Identifying dates in text.
- Extracting numbers from sentences.
- Replacing unwanted characters.
- Cleaning data before processing it.
- Validating form fields.
- Searching logs and configuration files.

For example, an academic certificate management system could use regular expressions 
to check whether a student identification number contains only digits or whether 
an academic year has the expected format.

However, checking a format does not necessarily prove that the information is 
correct or authentic.

---

# 3. How Do Regular Expressions Work?

A regular expression works by comparing a pattern against a sequence of characters.

The regular expression engine interprets the symbols in the pattern and determines 
whether the text satisfies the rules described by that pattern.

Consider this expression:

```regex
[0-9]{4}
```

We can break it down into two parts:

- `[0-9]` means one digit between `0` and `9`.
- `{4}` means exactly four repetitions of the preceding element.

Together, the expression describes four consecutive digits.

For example:

```text
1998
2026
1234
```

Each of these strings contains four consecutive digits.

However, the expression does not automatically require the entire input to 
contain exactly four digits. It can also match four digits inside a longer string.

For example, it can match `1998` inside:

```text
Year: 1998
```

It can also match four digits within:

```text
123456
```

To require the entire string to contain exactly four digits, we need additional symbols:

```regex
^[0-9]{4}$
```

The symbols `^` and `$` define the beginning and end of the input in this example.

The expression now requires the complete input to contain exactly four digits.

## 3.1 The Matching Process

Consider the following input:

```text
The student graduated in 1998.
```

And this pattern:

```regex
[0-9]{4}
```

Conceptually, the regular expression engine:

1. Examines the text.
2. Looks for a character that is a digit.
3. Checks whether four consecutive digits can be matched.
4. Identifies `1998` as a matching sequence.
5. Returns information about the match to the program.

The exact matching behavior depends on the pattern, its flags, and the method 
used to execute it.

## 3.2 Matching Is Different from Validation

These two tasks are related but not identical.

**Searching:**

```regex
[0-9]{4}
```

Question: Does the text contain four consecutive digits?

**Validation:**

```regex
^[0-9]{4}$
```

Question: Does the entire input consist of exactly four digits?

This distinction is fundamental.

A pattern that finds a valid sequence inside a string does not necessarily 
validate the complete string.

---

# 4. Creating Regular Expressions in JavaScript

JavaScript provides two common ways to create regular expressions.

## 4.1 Regular Expression Literal

The recommended approach for simple, fixed patterns is to use a regular expression literal.

```javascript
const pattern = /hello/;
```

The forward slashes `/` mark the beginning and end of the regular expression.

The pattern `hello` searches for that sequence of characters.

Example:

```javascript
const pattern = /hello/;

console.log(pattern.test("hello world"));
console.log(pattern.test("good morning"));
```

Output:

```text
true
false
```

The first string contains `hello`, while the second does not.

## 4.2 The RegExp Constructor

JavaScript also provides the `RegExp` constructor.

```javascript
const pattern = new RegExp("hello");
```

This creates a regular expression equivalent to:

```javascript
const pattern = /hello/;
```

The constructor is useful when a pattern must be created dynamically from a string.

For example:

```javascript
const word = "hello";
const pattern = new RegExp(word);

console.log(pattern.test("hello world"));
```

Output:

```text
true
```

An important difference is that special characters must be escaped appropriately 
when constructing patterns from strings.

For example:

```javascript
const pattern = new RegExp("\\d+");
```

Here, `\\` in the JavaScript string produces a backslash in the regular expression.

This represents one or more digits.

Compare that with the literal form:

```javascript
const pattern = /\d+/;
```

For beginners, regular expression literals are generally easier to read.

---

# 5. Literal Characters

The simplest regular expressions contain literal characters.

A literal character matches that character in the input.

For example:

```regex
cat
```

This pattern searches for the sequence `cat`.

Consider these strings:

| Input | Match? | Explanation |
|---|---|---|
| `cat` | Yes | Contains `cat` |
| `the cat sleeps` | Yes | Contains `cat` |
| `catalog` | Yes | Starts with `cat` |
| `dog` | No | Does not contain `cat` |
| `Cat` | No | Uppercase `C` differs from lowercase `c` |

By default, JavaScript regular expressions are case-sensitive.

We can change this behavior using a flag, which we will study later.

## Example

```javascript
const pattern = /cat/;

console.log(pattern.test("The cat is sleeping."));
console.log(pattern.test("The dog is sleeping."));
console.log(pattern.test("The Cat is sleeping."));
```

Output:

```text
true
false
false
```

Notice that `cat` can match part of a larger word, such as `catalog`.

If we need to match an entire word, we will need additional syntax.

---

# 6. Character Classes

A character class defines a set or range of characters that can match at a particular position.

Character classes are written inside square brackets `[]`.

## 6.1 Matching One of Several Characters

Consider this pattern:

```regex
[aeiou]
```

It matches one lowercase vowel:

- `a`
- `e`
- `i`
- `o`
- `u`

Example:

```javascript
const pattern = /[aeiou]/;

console.log(pattern.test("apple"));
console.log(pattern.test("sky"));
```

Output:

```text
true
false
```

The word `apple` contains a lowercase vowel. The string `sky` does not contain 
any of the vowels listed in the pattern.

The expression does not require all vowels to appear. It requires only one 
matching character somewhere in the input.

## 6.2 Matching a Range of Digits

The pattern:

```regex
[0-9]
```

matches one digit between `0` and `9`.

Examples:

```text
0
5
9
```

It does not match:

```text
a
-
```

Example:

```javascript
const pattern = /[0-9]/;

console.log(pattern.test("Student 123"));
console.log(pattern.test("Student ABC"));
```

Output:

```text
true
false
```

The first string contains digits, while the second does not.

## 6.3 Matching a Range of Lowercase Letters

```regex
[a-z]
```

Matches one lowercase English letter from `a` to `z`.

## 6.4 Matching a Range of Uppercase Letters

```regex
[A-Z]
```

Matches one uppercase English letter from `A` to `Z`.

## 6.5 Matching Letters and Digits

```regex
[A-Za-z0-9]
```

Matches one uppercase letter, lowercase letter, or digit.

Examples:

```text
A
m
7
```

## 6.6 Matching Characters Outside a Set

The caret `^` has a special meaning when it appears at the beginning of a 
character class.

For example:

```regex
[^0-9]
```

This matches one character that is not an ASCII digit.

Example:

```javascript
const pattern = /[^0-9]/;

console.log(pattern.test("12345"));
console.log(pattern.test("123A45"));
```

Output:

```text
false
true
```

The second string contains `A`, which is not a digit.

**Important:** Inside square brackets, `^` negates the character class when it 
appears first. Outside a character class, it can represent the beginning of the input.

The meaning depends on its position.

---

# 7. Common Character Shorthand

Regular expressions provide shorthand symbols for frequently used character categories.

| Pattern | Meaning |
|---|---|
| `\d` | An ASCII digit from `0` to `9` |
| `\D` | A character that is not an ASCII digit |
| `\w` | An ASCII word character: letters, digits, or underscore |
| `\W` | A character that is not an ASCII word character |
| `\s` | A whitespace character, such as a space, tab, or line break |
| `\S` | A character that is not whitespace |
| `.` | Any character except line terminators by default |

These shorthands are useful because they reduce the amount of syntax we need to write.

## 7.1 The `\d` Pattern

```regex
\d
```

Matches one digit.

Example:

```javascript
const pattern = /\d/;

console.log(pattern.test("Room 5"));
console.log(pattern.test("Room A"));
```

Output:

```text
true
false
```

## 7.2 The `\w` Pattern

```regex
\w
```

Matches one ASCII letter, digit, or underscore.

For example, it can match characters in:

```text
student
student_01
grade7
```

It does not match a hyphen or a space.

The default `\w` character class is not a general definition of all letters used 
in every language. Accented letters, such as `á`, and many other Unicode letters 
are not included by default.

## 7.3 The `\s` Pattern

```regex
\s
```

Matches whitespace.

Example:

```javascript
const pattern = /\s/;

console.log(pattern.test("Hello World"));
console.log(pattern.test("HelloWorld"));
```

Output:

```text
true
false
```

The first string contains a space.

## 7.4 The Dot `.`

The dot matches almost any single character except line terminators by default.

For example:

```regex
c.t
```

It can match:

```text
cat
cot
cut
c7t
```

The dot represents one character, not an arbitrary number of characters.

To allow it to match line terminators as well, JavaScript supports the `s` flag.

---

# 8. Quantifiers: How Many Times Can Something Appear?

Quantifiers specify how many times the preceding character, character class, or 
group may appear.

They are essential for describing patterns of different lengths.

| Quantifier | Meaning | Example |
|---|---|---|
| `*` | Zero or more occurrences | `a*` |
| `+` | One or more occurrences | `a+` |
| `?` | Zero or one occurrence | `a?` |
| `{n}` | Exactly `n` occurrences | `a{3}` |
| `{n,}` | At least `n` occurrences | `a{2,}` |
| `{n,m}` | Between `n` and `m` occurrences | `a{2,4}` |

## 8.1 The Asterisk `*`

The asterisk means zero or more occurrences of the preceding element.

```regex
ab*
```

This means:

- One `a`.
- Followed by zero or more `b` characters.

It can match:

```text
a
ab
abb
abbb
```

Example:

```javascript
const pattern = /ab*/;

console.log(pattern.test("a"));
console.log(pattern.test("ab"));
console.log(pattern.test("abbb"));
```

Output:

```text
true
true
true
```

The pattern does not require any `b` characters because the asterisk permits 
zero occurrences.

## 8.2 The Plus Sign `+`

The plus sign means one or more occurrences.

```regex
ab+
```

It can match:

```text
ab
abb
abbb
```

It cannot match `a` alone.

Example:

```javascript
const pattern = /ab+/;

console.log(pattern.test("a"));
console.log(pattern.test("ab"));
console.log(pattern.test("abbb"));
```

Output:

```text
false
true
true
```

## 8.3 The Question Mark `?`

The question mark means zero or one occurrence.

```regex
colou?r
```

This pattern matches both:

```text
color
colour
```

The `u` is optional.

Example:

```javascript
const pattern = /colou?r/;

console.log(pattern.test("color"));
console.log(pattern.test("colour"));
```

Output:

```text
true
true
```

## 8.4 Exact Repetition `{n}`

Suppose a student identification number must contain exactly five digits.

The pattern is:

```regex
\d{5}
```

This represents five consecutive digits.

However, it can still find five digits inside a longer string.

For complete validation, use:

```regex
^\d{5}$
```

Example:

```javascript
const pattern = /^\d{5}$/;

console.log(pattern.test("12345"));
console.log(pattern.test("1234"));
console.log(pattern.test("123456"));
```

Output:

```text
true
false
false
```

## 8.5 A Minimum Number of Occurrences `{n,}`

```regex
\d{3,}
```

Matches at least three consecutive digits.

It can match:

```text
123
1234
12345
```

## 8.6 A Range of Occurrences `{n,m}`

```regex
\d{2,4}
```

Matches between two and four consecutive digits.

The pattern can find a matching sequence within a longer string. It does not 
automatically restrict the entire input to two through four digits.

For complete validation, use:

```regex
^\d{2,4}$
```

---

# 9. Anchors: Beginning and End of Input

Anchors identify positions rather than matching ordinary characters.

They help us specify where a pattern must occur.

## 9.1 The Caret `^`

Outside a character class, the caret represents the beginning of the input when 
using ordinary non-multiline matching.

Example:

```regex
^Hello
```

This pattern matches text beginning with `Hello`.

```javascript
const pattern = /^Hello/;

console.log(pattern.test("Hello students"));
console.log(pattern.test("Good morning, Hello"));
```

Output:

```text
true
false
```

In the second string, `Hello` appears later, not at the beginning.

## 9.2 The Dollar Sign `$`

The dollar sign represents the end of the input when using ordinary non-multiline 
matching.

Example:

```regex
world$
```

This pattern matches text ending with `world`.

```javascript
const pattern = /world$/;

console.log(pattern.test("Hello world"));
console.log(pattern.test("world today"));
```

Output:

```text
true
false
```

## 9.3 Using Both Anchors

Consider:

```regex
^\d{4}$
```

This pattern requires the input to contain exactly four ASCII digits.

It accepts:

```text
1998
2026
1234
```

It rejects:

```text
Year 1998
123
12345
ABCD
```

The anchors prevent the pattern from accepting a four-digit substring inside a 
longer input.

**Technical note:** In JavaScript, `$` can also match immediately before a final 
line terminator. If a requirement demands strict whole-input validation that 
rejects trailing line breaks, account for that behavior explicitly.

---

# 10. Word Boundaries

The pattern `\b` represents a word boundary.

A word boundary occurs at a position where a word character and a non-word 
character meet, or at the beginning or end of a string when adjacent to a word character.

For example:

```regex
\bcat\b
```

This pattern looks for `cat` as a separate word.

Example:

```javascript
const pattern = /\bcat\b/;

console.log(pattern.test("The cat is sleeping."));
console.log(pattern.test("The catalog is available."));
```

Output:

```text
true
false
```

The second string contains `cat` as part of `catalog`, so it does not satisfy 
the word-boundary pattern.

However, JavaScript's default definition of a word character is based primarily 
on ASCII letters, digits, and underscores. Word boundaries may not behave as 
expected for every accented or non-Latin word.

---

# 11. Alternation: Matching Different Options

The vertical bar `|` means OR.

It allows a regular expression to match one alternative or another.

For example:

```regex
cat|dog
```

This pattern matches either `cat` or `dog`.

Example:

```javascript
const pattern = /cat|dog/;

console.log(pattern.test("I have a cat."));
console.log(pattern.test("I have a dog."));
console.log(pattern.test("I have a bird."));
```

Output:

```text
true
true
false
```

## 11.1 Grouping Alternatives

Parentheses allow us to group parts of a pattern.

Consider:

```regex
^(cat|dog)$
```

This matches exactly `cat` or `dog`.

```javascript
const pattern = /^(cat|dog)$/;

console.log(pattern.test("cat"));
console.log(pattern.test("dog"));
console.log(pattern.test("catalog"));
console.log(pattern.test("hotdog"));
```

Output:

```text
true
true
false
false
```

The anchors require the complete input to be one of the two alternatives.

---

# 12. Groups and Capturing Groups

Parentheses `()` group parts of a regular expression.

Groups are useful when a quantifier must apply to multiple characters or when we 
need to retrieve part of a match.

Consider:

```regex
(ab)+
```

This pattern matches one or more repetitions of the complete sequence `ab`.

It can match:

```text
ab
abab
ababab
```

It does not match `a` alone.

## 12.1 Capturing a Group

A capturing group allows us to retrieve a particular part of a match.

For example:

```javascript
const pattern = /Student: (\w+)/;

const result = pattern.exec("Student: Cristian");

console.log(result[0]);
console.log(result[1]);
```

Output:

```text
Student: Cristian
Cristian
```

Here:

- `result[0]` contains the complete matched text.
- `result[1]` contains the text captured by the first group.

The group `(\w+)` matches one or more word characters.

## 12.2 Non-Capturing Groups

Sometimes we need to group a pattern without storing the group's match separately.

We can use `(?:...)`.

Example:

```regex
^(?:cat|dog)$
```

This matches either `cat` or `dog` without creating a capturing group.

Non-capturing groups are useful when grouping is necessary but the captured value 
is not needed.

---

# 13. Escaping Special Characters

Some characters have special meanings in regular expressions.

For example:

```text
. * + ? ^ $ { } ( ) [ ] | \
```

If we want to match one of these characters literally, we often need to escape it 
with a backslash `\`.

For example, the dot `.` normally matches almost any character.

If we want to match an actual period, we use:

```regex
\.
```

Example:

```javascript
const pattern = /\./;

console.log(pattern.test("file.txt"));
console.log(pattern.test("file-txt"));
```

Output:

```text
true
false
```

The first string contains a literal period.

## 13.1 Matching a Dollar Sign

```regex
\$
```

Matches a literal dollar sign.

## 13.2 Matching Parentheses

```regex
\(
```

Matches a literal opening parenthesis.

## 13.3 Why Escaping Matters

Consider these patterns:

```regex
a.b
```

and:

```regex
a\.b
```

The first can match:

```text
acb
a-b
a.b
```

The second specifically matches the literal sequence:

```text
a.b
```

Understanding the difference between a special character and its escaped form is 
essential when writing precise patterns.

---

# 14. Flags: Changing How a Pattern Works

Flags modify the behavior of a regular expression.

In JavaScript, flags are written after the closing slash.

Example:

```javascript
const pattern = /hello/i;
```

The `i` flag makes the matching case-insensitive.

## 14.1 The Case-Insensitive Flag `i`

```javascript
const pattern = /hello/i;

console.log(pattern.test("hello"));
console.log(pattern.test("HELLO"));
console.log(pattern.test("Hello"));
```

Output:

```text
true
true
true
```

## 14.2 The Global Flag `g`

The `g` flag allows operations such as `match()` and `replace()` to process 
multiple matches.

Example:

```javascript
const pattern = /\d+/g;

const text = "Room 12, Floor 3, Building 45";

console.log(text.match(pattern));
```

Output:

```text
["12", "3", "45"]
```

Without the `g` flag, `match()` returns information about the first match rather 
than an array of all matched substrings.

## 14.3 The Multiline Flag `m`

The `m` flag changes how `^` and `$` work.

With this flag, they can match the beginning and end of individual lines instead 
of only the beginning and end of the complete input.

Example:

```javascript
const text = "First line\nSecond line\nThird line";
const pattern = /^Second line$/m;

console.log(pattern.test(text));
```

Output:

```text
true
```

The pattern matches the second line.

## 14.4 The Dot-All Flag `s`

The `s` flag allows the dot `.` to match line terminators.

Example:

```javascript
const pattern = /Hello.World/s;

console.log(pattern.test("Hello\nWorld"));
```

Output:

```text
true
```

Without the `s` flag, the dot would not match the newline character in this example.

## 14.5 Summary of Common Flags

| Flag | Purpose |
|---|---|
| `i` | Case-insensitive matching |
| `g` | Global matching for supported operations |
| `m` | Multiline behavior for anchors |
| `s` | Allows `.` to match line terminators |
| `u` | Enables Unicode-aware regular expression behavior |
| `y` | Sticky matching at the current `lastIndex` position |

For introductory exercises, focus on `i`, `g`, and `m` first.

---

# 15. JavaScript Methods for Working with Regular Expressions

JavaScript provides several methods for using regular expressions.

The most important methods for this lesson are:

- `test()`
- `exec()`
- `match()`
- `matchAll()`
- `replace()`
- `search()`

Each method serves a different purpose.

## 15.1 The `test()` Method

The `test()` method returns a Boolean value.

It answers the question:

"Does this regular expression find a match in the input?"

Example:

```javascript
const pattern = /^\d+$/;

console.log(pattern.test("12345"));
console.log(pattern.test("123A45"));
```

Output:

```text
true
false
```

This pattern checks whether the complete input consists of one or more ASCII digits.

Use `test()` when you only need a true-or-false result.

## 15.2 The `exec()` Method

The `exec()` method returns information about a match or `null` if no match is found.

Example:

```javascript
const pattern = /\d+/;
const result = pattern.exec("Student number: 12345");

console.log(result[0]);
console.log(result.index);
```

Output:

```text
12345
16
```

The `index` property identifies the position where the match begins.

Counting from zero, the first character of the string is at index `0`.

The `exec()` method also provides access to capturing groups.

Be careful when using `exec()` repeatedly with regular expressions containing 
the `g` or `y` flags, because these flags make the method's matching position 
depend on `lastIndex`.

## 15.3 The `match()` Method

The `match()` method belongs to strings.

It uses a regular expression to find matching text.

Example:

```javascript
const text = "There are 12 students and 3 teachers.";
const result = text.match(/\d+/g);

console.log(result);
```

Output:

```text
["12", "3"]
```

The global flag causes `match()` to return an array containing all matching substrings.

If no match is found, `match()` returns `null`.

## 15.4 The `matchAll()` Method

The `matchAll()` method returns an iterator containing information about all 
matches, including capturing groups.

It requires a global regular expression.

Example:

```javascript
const text = "Room 12, Floor 3";
const pattern = /(\w+) (\d+)/g;

for (const result of text.matchAll(pattern)) {
    console.log(result[0]);
    console.log(result[1]);
    console.log(result[2]);
}
```

Output:

```text
Room 12
Room
12
Floor 3
Floor
3
```

This is useful when we need more information than the matching substrings alone.

## 15.5 The `replace()` Method

The `replace()` method replaces matching text with another value.

Example:

```javascript
const text = "My phone number is 123-456-7890";
const result = text.replace(/\d/g, "*");

console.log(result);
```

Output:

```text
My phone number is ***-***-****
```

The regular expression matches every digit because it uses the global flag.

Each digit is replaced with an asterisk.

Without the global flag, only the first matching digit would be replaced.

## 15.6 The `search()` Method

The `search()` method returns the index of the first match.

If no match is found, it returns `-1`.

Example:

```javascript
const text = "Student number: 12345";
const position = text.search(/\d+/);

console.log(position);
```

Output:

```text
16
```

Use `search()` when you need to know where the first match occurs.

---

# 16. Practical Example: Validating a Student Identification Number

Imagine that an application requires a student identification number consisting 
of exactly ten digits.

We can create the following regular expression:

```regex
^\d{10}$
```

Let's examine its components.

| Component | Meaning |
|---|---|
| `^` | Beginning of input |
| `\d` | One digit |
| `{10}` | Exactly ten repetitions |
| `$` | End of input |

Together, they describe an input consisting of exactly ten digits.

## JavaScript Implementation

```javascript
const identificationPattern = /^\d{10}$/;

const identificationNumber = "1000000011";

if (identificationPattern.test(identificationNumber)) {
    console.log("The identification number has the expected format.");
} else {
    console.log("The identification number has an invalid format.");
}
```

Output:

```text
The identification number has the expected format.
```

Now consider these values:

```javascript
console.log(identificationPattern.test("1000000011"));
console.log(identificationPattern.test("100000001"));
console.log(identificationPattern.test("10000000112"));
console.log(identificationPattern.test("10000A0011"));
```

Output:

```text
true
false
false
false
```

The pattern checks the number of digits and rejects letters.

However, this expression does not establish that the identification number belongs 
to a real person or has been officially issued. It validates only its format.

---

# 17. Practical Example: Validating a Basic Username

Suppose we want to create a username with these requirements:

- It must contain between 4 and 12 characters.
- It may contain uppercase letters.
- It may contain lowercase letters.
- It may contain digits.
- It may contain underscores.
- It must not contain spaces or hyphens.

We can express these requirements as:

```regex
^[A-Za-z0-9_]{4,12}$
```

Let's break down the pattern:

- `^` requires the beginning of the input.
- `[A-Za-z0-9_]` allows letters, digits, and underscores.
- `{4,12}` requires between 4 and 12 characters.
- `$` requires the end of the input.

Example:

```javascript
const usernamePattern = /^[A-Za-z0-9_]{4,12}$/;

const usernames = [
    "student01",
    "John_Doe",
    "abc",
    "my user",
    "student-name",
    "verylongusername"
];

for (const username of usernames) {
    console.log(username, usernamePattern.test(username));
}
```

Output:

```text
student01 true
John_Doe true
abc false
my user false
student-name false
verylongusername false
```

This example demonstrates how several requirements can be combined into one pattern.

The backend must still enforce the application's actual username rules.

---

# 18. Practical Example: Finding an Email Address

Email addresses have a more complex structure than a simple sequence of characters.

For example:

```text
student@example.com
cristian.dev@example.org
admin123@university.edu
```

A simplified regular expression for basic email-format checking is:

```regex
^[^\s@]+@[^\s@]+\.[^\s@]+$
```

Let's understand the pattern.

| Component | Meaning |
|---|---|
| `^` | Beginning of input |
| `[^\s@]+` | One or more characters that are neither whitespace nor `@` |
| `@` | A literal at-sign |
| `[^\s@]+` | Another sequence of non-whitespace, non-`@` characters |
| `\.` | A literal period |
| `[^\s@]+` | One or more non-whitespace, non-`@` characters |
| `$` | End of input |

Example:

```javascript
const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

console.log(emailPattern.test("student@example.com"));
console.log(emailPattern.test("admin@university.edu"));
console.log(emailPattern.test("invalid-email"));
console.log(emailPattern.test("student @example.com"));
```

Output:

```text
true
true
false
false
```

**Important limitation:** This pattern checks only a simplified email format. 
It does not implement every rule of the email standards, prove that the address 
exists, or confirm that the user owns the address.

Real applications should use appropriate validation libraries and, when necessary, 
email verification.

---

# 19. Practical Example: Extracting Years from Text

Suppose we have the following text:

```text
The student completed grades in 1996, 1997, and 1998.
```

We want to extract all four-digit years.

We can use:

```regex
\b\d{4}\b
```

The pattern contains:

- `\b`: A word boundary.
- `\d{4}`: Four consecutive digits.
- `\b`: Another word boundary.

JavaScript example:

```javascript
const text = "The student completed grades in 1996, 1997, and 1998.";

const years = text.match(/\b\d{4}\b/g);

console.log(years);
```

Output:

```text
["1996", "1997", "1998"]
```

This example illustrates the difference between searching for a pattern and 
validating an entire input.

The pattern extracts matching sequences from a larger sentence rather than 
requiring the sentence to consist only of digits.

---

# 20. Greedy and Lazy Quantifiers

Quantifiers are greedy by default.

A greedy quantifier attempts to match as much text as possible while still 
allowing the complete expression to match.

Consider:

```javascript
const text = "<title>Introduction</title><title>Conclusion</title>";

console.log(text.match(/<title>.*<\/title>/)[0]);
```

Output:

```text
<title>Introduction</title><title>Conclusion</title>
```

The expression `.*` can match many characters, including the first closing tag 
and the text that follows it. Because the quantifier is greedy, it extends to the 
last closing tag that permits the complete pattern to match.

Now consider the lazy version:

```javascript
console.log(text.match(/<title>.*?<\/title>/)[0]);
```

Output:

```text
<title>Introduction</title>
```

The question mark after `*` makes the quantifier lazy.

A lazy quantifier attempts to match as little text as possible while still allowing 
the expression to match.

Common greedy and lazy forms include:

| Greedy | Lazy |
|---|---|
| `*` | `*?` |
| `+` | `+?` |
| `?` | `??` |
| `{2,5}` | `{2,5}?` |

Lazy quantifiers are useful in some text-processing tasks, but they do not 
automatically make a regular expression correct.

For structured formats such as HTML, JSON, or XML, a proper parser is usually 
more reliable than a regular expression.

---

# 21. Common Mistakes When Using Regular Expressions

Beginners often make similar mistakes when writing patterns.

## Mistake 1: Forgetting Anchors

Incorrect for complete validation:

```regex
\d{5}
```

This can find five digits inside a longer string.

For complete validation:

```regex
^\d{5}$
```

## Mistake 2: Confusing `*` and `+`

Remember:

```regex
\d*
```

Matches zero or more digits.

```regex
\d+
```

Matches one or more digits.

For example, `\d*` can match an empty sequence. If you require at least one digit, use `\d+`.

## Mistake 3: Forgetting to Escape a Period

This expression:

```regex
example.com
```

Does not require a literal period between `example` and `com`.

The dot matches almost any character except line terminators by default.

To require a literal period, write:

```regex
example\.com
```

## Mistake 4: Assuming `test()` Validates the Whole Input

Consider:

```javascript
console.log(/\d{4}/.test("Year 1998"));
```

Output:

```text
true
```

The pattern finds four digits inside the sentence.

To require exactly four digits in the entire input, use:

```javascript
console.log(/^\d{4}$/.test("Year 1998"));
```

Output:

```text
false
```

## Mistake 5: Assuming a Valid Format Means Valid Information

The pattern:

```regex
^\d{4}$
```

accepts `9999`.

However, `9999` may not represent a meaningful year in the application.

Regular expressions can validate the shape of information, but additional program 
logic may be required to validate its meaning.

## Mistake 6: Forgetting Case Sensitivity

```javascript
console.log(/hello/.test("HELLO"));
```

Output:

```text
false
```

Use the `i` flag if case-insensitive matching is appropriate:

```javascript
console.log(/hello/i.test("HELLO"));
```

Output:

```text
true
```

## Mistake 7: Using Regular Expressions for Every Validation Problem

Regular expressions are useful for text patterns, but they are not the best 
solution for every problem.

For example, checking whether a date exists on the calendar requires more than 
identifying a date-shaped string.

The input `2026-02-31` follows a year-month-day format, but February 31 is not 
a valid calendar date.

A regular expression can check the structure of the date. Additional date 
validation is needed to check whether the date actually exists.

---

# 22. Regular Expressions and Form Validation

Regular expressions are often used when validating forms.

Imagine a form with three fields:

- Student identification number.
- Username.
- Email address.

We can create a separate regular expression for each field.

```javascript
const identificationPattern = /^\d{10}$/;
const usernamePattern = /^[A-Za-z0-9_]{4,12}$/;
const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
```

A validation function could use them as follows:

```javascript
function validateStudentForm(identification, username, email) {
    const validIdentification =
        identificationPattern.test(identification);

    const validUsername =
        usernamePattern.test(username);

    const validEmail =
        emailPattern.test(email);

    return validIdentification && validUsername && validEmail;
}

console.log(
    validateStudentForm(
        "1000000011",
        "student01",
        "student@example.com"
    )
);
```

Output:

```text
true
```

The function returns `true` only when all three patterns match.

If any field fails its validation, the result is `false`.

Notice that the function combines regular expressions with ordinary JavaScript logic.

Regular expressions do not replace variables, conditions, functions, or Boolean 
operators. They complement them.

In a real web application, client-side validation improves user experience, but 
the backend must independently validate incoming data.

---

# 23. A Quick Reference Table

The following table summarizes the most important syntax introduced in this lesson.

| Syntax | Meaning | Example |
|---|---|---|
| `abc` | Literal sequence | `/abc/` |
| `[abc]` | One of the listed characters | `/[abc]/` |
| `[a-z]` | One lowercase English letter | `/[a-z]/` |
| `[A-Z]` | One uppercase English letter | `/[A-Z]/` |
| `[0-9]` | One ASCII digit | `/[0-9]/` |
| `[^0-9]` | One character other than an ASCII digit | `/[^0-9]/` |
| `\d` | ASCII digit | `/\d/` |
| `\w` | ASCII word character | `/\w/` |
| `\s` | Whitespace | `/\s/` |
| `.` | Almost any single character | `/a.b/` |
| `*` | Zero or more | `/a*/` |
| `+` | One or more | `/a+/` |
| `?` | Zero or one | `/a?/` |
| `{n}` | Exactly `n` repetitions | `/\d{4}/` |
| `{n,m}` | Between `n` and `m` repetitions | `/\d{2,4}/` |
| `^` | Beginning of input in ordinary non-multiline matching | `/^Hello/` |
| `$` | End of input in ordinary non-multiline matching | `/world$/` |
| `\b` | Word boundary | `/\bcat\b/` |
| `\|` | OR | `/cat\|dog/` |
| `(...)` | Capturing group | `/(ab)+/` |
| `(?:...)` | Non-capturing group | `/(?:cat\|dog)/` |
| `\.` | Literal period | `/example\.com/` |
| `i` | Case-insensitive flag | `/hello/i` |
| `g` | Global flag | `/\d+/g` |
| `m` | Multiline flag | `/^Hello$/m` |
| `s` | Dot-all flag | `/./s` |

In the table, the notation `\|` is used to display a literal vertical bar inside 
the Markdown table. In actual JavaScript regular expressions, the alternation 
operator is written as a plain `|`, as shown in the examples throughout the lesson.

---

# 24. Practical Exercises

Complete these exercises using JavaScript.

For each exercise, create a regular expression and test it with at least three 
different inputs.

Do not rely only on the examples provided in this lesson. Experiment with your 
own test cases.

## Exercise 1: Find a Digit

Create a regular expression that determines whether a string contains at least 
one digit.

Test these values:

```text
"Hello"
"Hello123"
"2026"
```

Expected behavior:

- `"Hello"` should return `false`.
- `"Hello123"` should return `true`.
- `"2026"` should return `true`.

## Exercise 2: Validate a Four-Digit Year

Create a regular expression that accepts exactly four digits.

Test these values:

```text
"1998"
"2026"
"123"
"12345"
"Year 1998"
```

Only strings containing exactly four digits should be accepted.

## Exercise 3: Validate a Username

Create a regular expression for a username with these rules:

- Between 5 and 10 characters.
- Only uppercase letters, lowercase letters, digits, and underscores.
- No spaces.
- No hyphens.

Test these values:

```text
"student1"
"John_Doe"
"abc"
"my user"
"student-name"
```

## Exercise 4: Find All Numbers in a Sentence

Given this string:

```text
There are 25 students, 3 teachers, and 2 classrooms.
```

Use a regular expression and `match()` to extract all numbers.

Expected output:

```text
["25", "3", "2"]
```

## Exercise 5: Replace Spaces with Hyphens

Given:

```text
"regular expressions are useful"
```

Use a regular expression and `replace()` to produce:

```text
"regular-expressions-are-useful"
```

Your solution must replace every space, not only the first one.

## Exercise 6: Validate an Identification Number

Create a regular expression that accepts exactly eight digits.

Test these values:

```text
"12345678"
"1234567"
"123456789"
"1234AB78"
```

Explain why each input is accepted or rejected.

## Exercise 7: Search for a Word

Create a regular expression that finds the word `student` without matching the 
same sequence inside a longer word.

Test these values:

```text
"The student is here."
"The students are here."
"The student_record is available."
```

Explain how word boundaries affect the results.

## Exercise 8: Validate a Basic Email Format

Create a regular expression that checks a simplified email format.

Test these values:

```text
"student@example.com"
"admin@university.edu"
"invalid-email"
"student @example.com"
```

Explain what the regular expression checks and what it cannot guarantee.

## Exercise 9: Extract Academic Years

Given this string:

```text
Historical records: 1985, 1986, 1987, and 1988.
```

Extract every four-digit sequence using a regular expression.

Expected output:

```text
["1985", "1986", "1987", "1988"]
```

## Exercise 10: Combine Multiple Validations

Create a function named `validateStudentData()`.

The function must receive three arguments:

- An identification number containing exactly ten digits.
- A username containing between 4 and 12 permitted characters.
- An email address following the simplified format used in this lesson.

The function must return `true` only when all three fields satisfy their 
respective patterns.

Test the function with both valid and invalid inputs.

---

# 25. Challenge: A Small Student Registration Validator

Now combine what you have learned into a single practical exercise.

Imagine that you are developing a student registration form for an academic 
information system.

The form collects:

```text
Student identification number
Username
Email address
Graduation year
```

Your task is to write a JavaScript program that validates all four fields.

## Requirements

1. The identification number must contain exactly ten digits.
2. The username must contain between 4 and 12 characters.
3. The username may contain letters, digits, and underscores only.
4. The email address must follow the simplified format from this lesson.
5. The graduation year must contain exactly four digits.
6. The program must display a separate validation result for each field.
7. The program must display a final message indicating whether the registration 
data passed all format checks.

## Suggested Structure

```javascript
const identificationPattern = /^\d{10}$/;
const usernamePattern = /^[A-Za-z0-9_]{4,12}$/;
const emailPattern = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
const graduationYearPattern = /^\d{4}$/;

// Create a function to validate the input fields.
// Print the result of each validation.
// Print a final result for the complete form.
```

Use this structure as a starting point, but implement the validation logic yourself.

Remember that passing these checks does not prove that the student exists, that 
the identification number is authentic, or that the graduation year is historically 
valid.

Those requirements need additional application logic and authoritative data.

---

# 26. Key Takeaways

Regular expressions are a powerful tool for describing patterns in text.

The most important concepts from this lesson are:

1. A regular expression describes a pattern rather than necessarily representing one specific string.
2. Character classes specify which characters are allowed at a particular position.
3. Quantifiers specify how many times a pattern may occur.
4. Anchors help determine where a pattern must appear.
5. Groups allow us to combine expressions and capture matching information.
6. Flags change how regular expressions behave.
7. JavaScript provides methods such as `test()`, `exec()`, `match()`, `matchAll()`, `replace()`, and `search()` for working with regular expressions.
8. Searching for a pattern is different from validating an entire input.
9. Validating a format is different from validating the meaning or authenticity of information.
10. Regular expressions complement ordinary programming logic; they do not replace it.

The goal is not to memorize every symbol immediately. Instead, learn to identify 
the requirement, translate it into a pattern, test the pattern against different 
inputs, and refine it when necessary.

Regular expressions become easier to understand through repeated practice and 
careful examination of matching and non-matching examples.

---

# 27. Additional Learning Resources

- **MDN Web Docs — Regular expressions:** https://developer.mozilla.org/en-US/docs/Web/JavaScript/Guide/Regular_expressions
- **MDN Web Docs — RegExp:** https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp
- **MDN Web Docs — String.match():** https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/match
- **MDN Web Docs — RegExp.test():** https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/RegExp/test
- **Regex101:** https://regex101.com/

Regex101 is an interactive environment where students can write regular expressions, 
enter sample text, and observe which parts of the text match the pattern. 
When using it, select the JavaScript flavor for consistency with this lesson.

Use the official JavaScript documentation as the primary reference for 
language-specific behavior.