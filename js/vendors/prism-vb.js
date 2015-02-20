/*
 ===============================================================================
 Quickie Visual Basic highlighter, with just the syntax I need. DHW 10/23/2008
 ===============================================================================
 */

Prism.languages.vb = {
    comment: /'.*/,
    string: /\"[^\"\\\n]*(?:\\.[^\"\\\n]*)*\"/,
    operator: /[-+*\/]|=?\&lt;|=?\&gt;|=/,
    number: /\b(?:[+-]?(?:\d*\.?\d+|\d+\.?\d*)(?:[eE][+-]?\d+)?)|(?:0x[a-f0-9]+)\b/,
    keyword: /\b(?:As|Dim|Each|Else|ElseIf|End|Exit|For|Function|If|In|Next|Not|Public|Private|Set|Sub|Then)\b/i
}