# Day 06 – Linux File Read/Write Practice

## Objective

Practice basic Linux file handling commands.

---

## Commands Practiced

### 1. Create a File

```bash
touch notes.txt
```

Creates an empty file named `notes.txt`.

---

### 2. Write Text into a File

```bash
echo "Linux file practice started" > notes.txt
```

Writes a line into the file, **overwriting** any existing content.

---

### 3. Append New Lines

```bash
echo "Learning redirection operators" >> notes.txt
echo "Practicing Linux fundamentals" >> notes.txt
```

Appends new lines to the file without removing existing content.

---

### 4. Write and Display Together

```bash
echo "Using tee command" | tee -a notes.txt
```

Sends output to **both** the terminal and the file simultaneously. The `-a` flag appends instead of overwriting.

---

### 5. Read Full File

```bash
cat notes.txt
```

Displays the entire contents of the file.

---

### 6. Read First 2 Lines

```bash
head -n 2 notes.txt
```

Displays only the **first 2 lines** of the file.

---

### 7. Read Last 2 Lines

```bash
tail -n 2 notes.txt
```

Displays only the **last 2 lines** of the file.

---

## Key Learnings

| Command / Operator | Description |
|--------------------|-------------|
| `>`                | Overwrites file content |
| `>>`               | Appends content to file |
| `cat`              | Reads and displays the entire file |
| `head -n N`        | Displays the first N lines |
| `tail -n N`        | Displays the last N lines |
| `tee -a`           | Writes to file and displays output simultaneously |

> These commands are commonly used for managing **logs**, **config files**, and **automation tasks** in DevOps workflows.

---

### 8. Append Content

**Using `>>`**

```bash
echo "New line added" >> notes.txt
```

Appends a new line to the file without overwriting existing content.

**Using `tee`**

```bash
echo "Another line" | tee -a notes.txt
```

Appends while also printing the output to the terminal.

---

### 9. Using Nano Editor

**Open or create a file**

```bash
nano notes.txt
```

**Inside nano — type your content, then:**

| Action      | Shortcut           |
|-------------|--------------------|
| Save file   | `Ctrl + O` → `Enter` |
| Exit nano   | `Ctrl + X`         |

---

### 10. Using Vim Editor

**Open or create a file**

```bash
vim notes.txt
```

**Inside vim — key commands:**

| Action              | Key / Command        |
|---------------------|----------------------|
| Enter insert mode   | `i`                  |
| Exit insert mode    | `ESC`                |
| Save and quit       | `:wq` → `Enter`      |
| Exit without saving | `:q!` → `Enter`      |

---

### 11. Rename a File

```bash
mv notes.txt devops-notes.txt
```

Renames `notes.txt` to `devops-notes.txt`. `mv` also moves files between directories.

---

### 12. Copy a File

```bash
cp notes.txt backup.txt
```

Creates a copy of `notes.txt` named `backup.txt`.

---

### 13. Delete a File

```bash
rm notes.txt
```

Permanently deletes the file. Use with caution — there is no recycle bin.

---

### 14. Check File Details

```bash
ls -l
```

Lists files with details: permissions, owner, size, and last modified timestamp.

---

## Key Learnings (Updated)

| Command / Operator | Description |
|--------------------|-------------|
| `>`                | Overwrites file content |
| `>>`               | Appends content to file |
| `cat`              | Reads and displays the entire file |
| `head -n N`        | Displays the first N lines |
| `tail -n N`        | Displays the last N lines |
| `tee -a`           | Writes to file and displays output simultaneously |
| `nano`             | Beginner-friendly terminal text editor |
| `vim`              | Powerful terminal text editor (modal) |
| `mv`               | Renames or moves files |
| `cp`               | Copies files |
| `rm`               | Deletes files permanently |
| `ls -l`            | Lists files with detailed metadata |

> These commands are commonly used for managing **logs**, **config files**, and **automation tasks** in DevOps workflows.

---