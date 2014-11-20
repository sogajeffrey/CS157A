<?php
session_start();
	
    $uID = $_SESSION['uID'];
	include("dbconnect.php");
	
	<section id="main" class="container large">

  <table id="results" class="display" cellspacing="0" width="100%">

    <thead>

      <tr>

        <th>Video Link</th>

        <th>Video Title</a></th>

        <th>Video Length</a></th>

        <th>Highest Resolution</a></th>

        <th>Video Description</a></th>

        <th>Language</a></th>

        <th>View Count</a></th>

        <th>Video Type</a></th>

        <th>Tag</a></th>

      </tr>

    </thead>

    <tbody>

      <?php

	  while (list($link, $title, $length, $res, $desc, $lang, $count, $type, $icon, $tag) = mysqli_fetch_array($result))

        {

			print "<tr>";

			echo "<td><a href=\"$link\" target=\"_blank\"> <img src=\"$icon\" width=\"100\" height=\"100\"></a> </td>";

			print "<td> $title </td>";

			print "<td> $length </td>";

			print "<td> $res </td>";

			print "<td> $desc </td>";

			print "<td> $lang </td>";

			print "<td> $count </td>";

			print "<td> $type </td>";

			print "<td> $tag </td>";

			print "</tr>";

        }

		mysqli_free_result($result);

	  ?>
</tbody>
</table>
</section>

<section id="main" class="container small">
  <form method="post" action="search.php">
    <div class="row uniform half collapse-at-2">
      <div class="8u">
        <input type="text" name="search" id="text" />
      </div>
      <div class="4u">
        <input type="submit" value="Search Again" class="fit" />
      </div>
    </div>
  </form>
</section>
?>