<?xml version="1.0" encoding="UTF-8"?>
<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

  <!-- Match the root element of the XML (library) -->
  <xsl:template match="/">
    <html>
      <head>
        <title>Library Book List</title>
        <style>
          body {
            font-family: Arial, sans-serif;
            background-color: #f0f0f0;
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
        </style>
      </head>
      <body>
        <h1 align="center">Library Book List</h1>
        <table>
          <tr>
            <th>Title</th>
            <th>Author</th>
            <th>Genre</th>
            <th>Price</th>
          </tr>
          <!-- Loop through each book element -->
          <xsl:for-each select="library/book">
            <tr>
              <td><xsl:value-of select="title"/></td>
              <td><xsl:value-of select="author"/></td>
              <td><xsl:value-of select="genre"/></td>
              <td><xsl:value-of select="price"/></td>
            </tr>
          </xsl:for-each>
        </table>
      </body>
    </html>
  </xsl:template>

</xsl:stylesheet>