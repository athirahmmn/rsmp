<%-- 
    Document   : index
    Created on : Jun 28, 2024, 12:57:53 AM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Healthy Meal Plans</title>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
  <style>
    body {
        margin: 0;
        padding: 0;
        font-family: sans-serif;
        box-sizing: border-box;
        background: linear-gradient(to right, #f7cac9, #dec2cb, #c5b9cd, #abb1cf, #92a8d1);
      }

      /* Header styling */
      .header { /* A light blue color */
        color: white;
        padding: 20px 0;
        text-align: center;
      }

      /* Navigation bar styling */
      .nav { /* Same light blue as header */
        color: white;
        padding: 10px 0;
        text-align: right;
        margin-right: 20px;
      }

      .nav ul {
        margin: 0;
        padding: 0;
        list-style: none;
      }

      .nav li {
        display: inline-block;
        padding: 10px 20px;
      }

      .nav a {
        color: white;
        text-decoration: none;
        text-align: left;
      }

      .nav a:hover {
        color: #296AAE; /* A darker blue color */
      }

      .main {
        position: absolute;
        top: 60px;
        width: 94%;
        left: 50px;
        min-height: calc(100vh - 60px);
      }

  .cards {
    width: 94%;
    padding: 35px 20px;
    display: grid;
    grid-template-columns: repeat(5, 1fr);
    grid-gap: 20px;
  }

  .cards .card {
    padding: 20px;
    display: flex;
    align-items: center;
    justify-content: space-between;
    background: #fff;
    border-radius: 10px;
    box-shadow: 0 7px 25px 0 rgba(0,0,0,0.08);
  }

  .number {
    font-size: 35px;
    font-weight: 500;
    color:#296AAE;
  }

  .card-name {
    color:#756a7c;
    font-weight: 600;
  }

  .icon-box i{
    font-size: 45px;
    color:#abb1cf;
  }

  .charts {
    display: grid;
    grid-template-columns: 2fr 1fr;
    grid-gap: 20px;
    width: 94%;
    padding: 20px;
    padding-top: 0;
  }

  .chart {
    background: #fff;
    padding: 5px 20px;
    border-radius: 10px;
    box-shadow: 0 7px 25px rgba(0,0,0,0.08);
    width: 90.5%;
  }

  .chart h2 {
    margin-bottom: 5px;
    font-size: 20px;
    color:#296AAE;
    text-align: center;
  }


  </style>
</head>
<body>
  <header class="header">
    <nav class="nav">
      <div class="container">
        <ul>
          <li><a href="index.jsp">Dashboard</a></li>
          <li><a href="browseRecipe.jsp">Browse Recipe</a></li>
          <li><a href="mealPlanner.jsp">Meal Planner</a></li>
          <li><a href="profile.jsp">Profile</a></li>
        </ul>
      </div>
    </nav>
  </header>
  <div class='main'>
    <div class='cards'>
      <div class='card'>
        <div class='card-content'>
          <div class='number'>10</div>
          <div class='card-name'>Recipes</div>
        </div>
        <div class='icon-box'>
          <i span class='material-symbols-outlined'>menu_book</i>
        </div>
      </div>
      <div class='card'>
        <div class='card-content'>
          <div class='number'>3</div>
          <div class='card-name'>Breakfast</div>
        </div>
        <div class='icon-box'>
          <i span class='material-symbols-outlined'>egg_alt</i>
        </div>
      </div>
      <div class="card">
        <div class="card-content">
          <div class="number">2</div>
          <div class="card-name">Lunch</div>
        </div>
        <div class="icon-box">
          <i span class="material-symbols-outlined">lunch_dining</i>
        </div>
      </div>
      <div class="card">
        <div class="card-content">
          <div class="number">2</div>
          <div class="card-name">Snack</div>
        </div>
        <div class="icon-box">
          <i span class="material-symbols-outlined">icecream</i>
        </div>
      </div>
      <div class="card">
        <div class="card-content">
          <div class="number">3</div>
          <div class="card-name">Dinner</div>
        </div>
        <div class="icon-box">
          <i span class="material-symbols-outlined">dinner_dining</i>
        </div>
      </div>
    </div>
    <div class="charts">
      <div class="chart">
        <h2>Recipe View (Week)</h2>
        <canvas id="myChart"></canvas>
      </div>
      <div class="chart" id="doughnut-chart">
        <h2>Favourite Meal (week)</h2>
        <canvas id="doughnut"></canvas>
      </div>
    </div>
  </div>
  <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
  <script>
    const ctx = document.getElementById('myChart');

    new Chart(ctx, {
      type: 'line',
      data: {
        labels: ['Sun', 'Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
        datasets: [{
          label: 'Viewer',
          data: [12, 19, 23, 19, 27, 12, 13],
          backgroundColor: [
              'rgba(85,85,85,1)'
          ],
          borderColor: [
              'rgb(41,155,99)'
          ],
          borderWidth: 1
        }]
      },
      options: {
          responsive: true
      }
    });
  </script>
  <script>
      const ctx2 = document.getElementById('doughnut').getContext('2d');

        new Chart(ctx2, {
          type: 'doughnut',
          data: {
            labels: ['ayam gepuk', 'zus coffee', 'nasi tomyam', 'ayam gunting', 'puasa'],
            datasets: [{
              label: 'Favourite meal',
              data: [5, 1, 2, 2, 1],
              borderWidth: 1
            }]
          },
          options: {
            responsive: true,
          }
        });
  </script>
</body>
</html>