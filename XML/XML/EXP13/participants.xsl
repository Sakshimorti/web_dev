<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- Match the root of the XML -->
  <xsl:template match="/">
    <html>
      <head>
        <title>Participant Marks</title>
        <style>
          body {
            font-family: Arial, sans-serif;
            background-color: #f0f8ff;
            color: #333;
            padding: 20px;
          }
          table {
            width: 80%;
            margin: 30px auto;
            border-collapse: collapse;
            background-color: #ffffff;
          }
          th, td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: left;
          }
          th {
            background-color: #4CAF50;
            color: white;
          }
          tr:nth-child(even) {
            background-color: #f2f2f2;
          }
          .pass {
            color: green;
            font-weight: bold;
          }
          .fail {
            color: red;
            font-weight: bold;
          }
        </style>
      </head>
      <body>
        <h1 align="center">Participant Marks and Results</h1>
        <table>
          <tr>
            <th>Name</th>
            <th>Roll No</th>
            <th>Marks</th>
            <th>Result</th>
          </tr>
          
          <!-- Iterate through each participant in the XML -->
          <xsl:for-each select="participants/participant">
            <tr>
              <td><xsl:value-of select="name" /></td>
              <td><xsl:value-of select="rollNo" /></td>
              <td>
                <!-- Iterate through each subject and show marks -->
                <xsl:for-each select="subject">
                  <xsl:value-of select="@name" />: <xsl:value-of select="." /><br />
                </xsl:for-each>
              </td>
              
              <!-- Check if the participant has passed or failed -->
              <td>
                <xsl:variable name="totalMarks" select="sum(subject)" />
                <xsl:variable name="passMarks" select="60" />
                <xsl:if test="$totalMarks >= $passMarks">
                  <span class="pass">Pass</span>
                </xsl:if>
                <xsl:if test="$totalMarks &lt; $passMarks">
                  <span class="fail">Fail</span>
                </xsl:if>
              </td>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>