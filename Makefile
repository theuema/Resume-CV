.PHONY: all 

CC = xelatex
RESUME_DIR = resume
BUILD_DIR = build
CV_DIR = cv
RESUME_SRCS = $(shell find $(RESUME_DIR) -name '*.tex')
CV_SRCS = $(shell find $(CV_DIR) -name '*.tex')

all: $(foreach x, coverletter cv resume, $(BUILD_DIR)/$x.pdf)

resume.pdf: resume.tex $(RESUME_SRCS)
	$(CC) -output-directory=$(BUILD_DIR) $<

cv.pdf: cv.tex $(CV_SRCS)
	$(CC) -output-directory=$(BUILD_DIR) $<

coverletter.pdf: coverletter.tex
	$(CC) -output-directory=$(BUILD_DIR) $<

clean:
	rm -rf $(BUILD_DIR)/*.pdf