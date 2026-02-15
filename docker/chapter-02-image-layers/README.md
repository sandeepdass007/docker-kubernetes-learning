# Chapter 2 --- Docker Image Layers & Cache

This chapter demonstrates **how Docker builds images internally** and
why Dockerfile structure matters for performance and correctness.

The learning here is **visual and experiential** --- Docker's own build
output is the explanation.

------------------------------------------------------------------------

## What you will learn

By the end of this chapter, you will understand:

-   Docker builds images **layer by layer**
-   Each Dockerfile instruction creates a **new layer**
-   Docker reuses layers using its **build cache**
-   Changing a file invalidates **only specific layers**
-   Why the **order of instructions** in a Dockerfile matters

------------------------------------------------------------------------

## Files in this chapter

-   `Dockerfile`\
    Fully self-documented. Explains how layers are created and reused.

-   `message.txt`\
    A simple text file used to demonstrate cache invalidation.

-   `run.sh`\
    Builds the image and runs the container, with clear output.

-   `clean.sh`\
    Removes the image created by this chapter.

------------------------------------------------------------------------

## Step 1 --- Initial build

Run the chapter for the first time:

``` bash
./run.sh
```

Observe the Docker build output: - All steps are executed - All layers
are created fresh

This is expected for the first build.

------------------------------------------------------------------------

## Step 2 --- Run again without changes

Run the same command again:

``` bash
./run.sh
```

This time, observe carefully: - Docker reports layers as **CACHED** -
The build completes much faster

This means Docker reused previously built layers.

------------------------------------------------------------------------

## Step 3 --- Modify a file

Edit `message.txt` and change its contents, for example:

``` text
Hello from a modified Docker layer!
```

Now run again:

``` bash
./run.sh
```

Observe the build output: - Docker reuses layers **before** the `COPY`
instruction - Docker rebuilds the `COPY` layer and everything **after
it**

This behavior is deterministic and intentional.

------------------------------------------------------------------------

## Key takeaway

Docker caching works by comparing: - The instruction itself - The files
involved in that instruction

If either changes, Docker rebuilds that layer and all subsequent layers.

This is why **Dockerfile instruction order is critical** in real-world
projects.

------------------------------------------------------------------------

## Clean up

After experimentation, clean up the image:

``` bash
./clean.sh
```

------------------------------------------------------------------------

## Final note

Do not rush this chapter.

Re-run it. Modify the file multiple times. Watch the build output
carefully.

Understanding this chapter well will make all future Docker topics
significantly easier.
