
Rails.application.config.html_email_css_font = "font-family:'Helvetica Neue', Helvetica, Arial, Geneva, sans-serif; font-size: 12px;"

Rails.application.config.html_email_body = <<HERE
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <style type="text/css">
      body {
        width: 90% !important;
        -webkit-text-size-adjust: 90%;
        -ms-text-size-adjust: 90%;
        #{Rails.application.config.html_email_css_font};
      }
      img {
        outline: none;
        text-decoration: none;
        -ms-interpolation-mode: bicubic;
      }
      a img {
        border: none;
      }
      table td {
        border-collapse: collapse;
      }
      table {
        border-collapse: collapse;
        mso-table-lspace: 0pt;
        mso-table-rspace: 0pt;
        border: none;
        table-layout: auto;
        display: block;
        width: 100%;
        overflow: auto;
        word-break: keep-all;
      }
      p, table, div, td {
        max-width: 600px;
      }
      table,
      pre,
      blockquote {
        margin: 0 0 16px;
      }
      td, th {
        padding: 7px 12px;
        border: 1px solid hsl(0,0%,87%);
      }
      th {
        font-weight: bold;
        text-align: center;
      }
      tbody tr:nth-child(even) {
        background: hsl(0,0%,97%);
      }
      col {
        width: auto;
      }
      p {
        margin: 0;
      }
      code {
        border: none;
        background: hsl(0,0%,97%);
        white-space: pre-wrap;
      }
      blockquote {
        padding: 8px 12px;
        border-left: 5px solid #eee;
      }
      pre {
        padding: 12px 15px;
        font-size: 13px;
        line-height: 1.45;
        background: hsl(0,0%,97%);
        white-space: pre-wrap;
        border-radius: 3px;
        border: none;
        overflow: auto;
      }
    </style>
  <head>
  <body style="#{Rails.application.config.html_email_css_font}">###html###</body>
</html>
HERE
