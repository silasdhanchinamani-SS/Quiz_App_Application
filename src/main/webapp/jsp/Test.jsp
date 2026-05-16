<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Active Assessment | Quiz Platform</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="/css/style.css">
    <style>
        .test-header {
            position: sticky;
            top: 0;
            z-index: 100;
            background: rgba(15, 23, 42, 0.9);
            backdrop-filter: blur(8px);
            border-bottom: 1px solid var(--glass-border);
            padding: 1rem 0;
            margin-bottom: 2rem;
        }
        .timer-container {
            background: linear-gradient(135deg, var(--secondary), var(--accent));
            padding: 0.5rem 1.5rem;
            border-radius: 50px;
            font-weight: 700;
            font-family: monospace;
            font-size: 1.25rem;
            display: inline-flex;
            align-items: center;
            gap: 0.5rem;
        }
        .question-card {
            background: var(--glass-bg);
            border: 1px solid var(--glass-border);
            border-radius: 16px;
            padding: 2rem;
            margin-bottom: 1.5rem;
            transition: border-color 0.3s ease;
        }
        .question-card:hover {
            border-color: var(--primary);
        }
        .question-text {
            font-size: 1.1rem;
            font-weight: 600;
            margin-bottom: 1.5rem;
            display: block;
        }
        .option-label {
            display: flex;
            align-items: center;
            gap: 1rem;
            padding: 0.75rem 1rem;
            border-radius: 10px;
            background: rgba(255, 255, 255, 0.03);
            margin-bottom: 0.5rem;
            cursor: pointer;
            transition: background 0.2s ease;
        }
        .option-label:hover {
            background: rgba(255, 255, 255, 0.08);
        }
        .option-label input[type="radio"] {
            width: auto;
            margin: 0;
        }
        .section-title {
            font-size: 1.5rem;
            font-weight: 700;
            margin: 3rem 0 1.5rem 0;
            padding-left: 1rem;
            border-left: 4px solid var(--primary);
        }
        .marks-tag {
            font-size: 0.8rem;
            color: var(--text-muted);
            font-weight: 400;
            margin-left: 0.5rem;
        }
    </style>
    <script>
        function startTimer(duration, display) {
            var timer = duration, minutes, seconds;
            var interval = setInterval(function () {
                minutes = parseInt(timer / 60, 10);
                seconds = parseInt(timer % 60, 10);

                minutes = minutes < 10 ? "0" + minutes : minutes;
                seconds = seconds < 10 ? "0" + seconds : seconds;

                display.textContent = minutes + ":" + seconds;

                if (--timer < 0) {
                    clearInterval(interval);
                    document.forms["testForm"].submit();
                }
            }, 1000);
        }

        window.onload = function () {
            var durationInMinutes = ${test.duration};
            var display = document.querySelector('#timer');
            startTimer(60 * durationInMinutes, display);
        };
    </script>
</head>
<body>
    <div class="test-header">
        <div class="container" style="display: flex; justify-content: space-between; align-items: center; padding: 0 2rem;">
            <div>
                <h1 style="font-size: 1.5rem; margin: 0; text-align: left;">${test.name}</h1>
                <p style="font-size: 0.8rem; color: var(--text-muted); margin: 0;">Batch: ${test.batchCode} | Max Marks: ${test.totalMarks}</p>
            </div>
            <div class="timer-container">
                <span style="font-size: 0.8rem; opacity: 0.8;">TIME LEFT:</span>
                <span id="timer">--:--</span>
            </div>
        </div>
    </div>

    <div class="container" style="max-width: 800px; padding-bottom: 5rem;">
        <form id="testForm" name="testForm" action="/student/submit-test/${test.id}" method="POST">
            <!-- MCQ Section -->
            <c:if test="${test.mcqs != null && !test.mcqs.isEmpty()}">
                <h2 class="section-title">Multiple Choice Questions</h2>
                <c:forEach var="question" items="${test.mcqs}">
                    <div class="question-card">
                        <span class="question-text">${question.question} <span class="marks-tag">(${question.marks} marks)</span></span>
                        
                        <label class="option-label">
                            <input type="radio" required="required" name="answer[${question.id}]" value="A">
                            <span><strong>A:</strong> ${question.optionA}</span>
                        </label>
                        <label class="option-label">
                            <input type="radio" name="answer[${question.id}]" value="B">
                            <span><strong>B:</strong> ${question.optionB}</span>
                        </label>
                        <label class="option-label">
                            <input type="radio" name="answer[${question.id}]" value="C">
                            <span><strong>C:</strong> ${question.optionC}</span>
                        </label>
                        <label class="option-label">
                            <input type="radio" name="answer[${question.id}]" value="D">
                            <span><strong>D:</strong> ${question.optionD}</span>
                        </label>
                    </div>
                </c:forEach>
            </c:if>

            <!-- True/False Section -->
            <c:if test="${test.trueFalseQuestions != null && !test.trueFalseQuestions.isEmpty()}">
                <h2 class="section-title">True or False</h2>
                <c:forEach var="question" items="${test.trueFalseQuestions}">
                    <div class="question-card">
                        <span class="question-text">${question.question} <span class="marks-tag">(${question.marks} marks)</span></span>
                        
                        <label class="option-label">
                            <input type="radio" name="answer[${question.id}]" value="true" required="required">
                            <span>True</span>
                        </label>
                        <label class="option-label">
                            <input type="radio" name="answer[${question.id}]" value="false">
                            <span>False</span>
                        </label>
                    </div>
                </c:forEach>
            </c:if>

            <!-- Descriptive Section -->
            <c:if test="${test.descriptiveQuestions != null && !test.descriptiveQuestions.isEmpty()}">
                <h2 class="section-title">Descriptive Analysis</h2>
                <c:forEach var="question" items="${test.descriptiveQuestions}">
                    <div class="question-card">
                        <span class="question-text">${question.question} <span class="marks-tag">(${question.marks} marks)</span></span>
                        <textarea name="answer[${question.id}]" required="required" placeholder="Type your detailed answer here..." style="min-height: 150px;"></textarea>
                    </div>
                </c:forEach>
            </c:if>

            <div style="margin-top: 3rem; text-align: center;">
                <button type="submit" class="btn btn-primary" style="padding: 1.25rem 4rem; font-size: 1.2rem;">Complete & Submit Assessment</button>
            </div>
        </form>
    </div>
    
    <footer style="background: rgba(0,0,0,0.2); backdrop-filter: blur(4px);">
        <p>&copy; 2026 Quiz Platform. Secure Examination Environment.</p>
    </footer>
</body>
</html>
