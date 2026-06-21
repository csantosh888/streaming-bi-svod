[1mdiff --git a/notebooks/01_explore.ipynb b/notebooks/01_explore.ipynb[m
[1mindex 6313eb7..a9c9b4d 100644[m
[1m--- a/notebooks/01_explore.ipynb[m
[1m+++ b/notebooks/01_explore.ipynb[m
[36m@@ -12,20 +12,1034 @@[m
   },[m
   {[m
    "cell_type": "code",[m
[31m-   "execution_count": null,[m
[32m+[m[32m   "execution_count": 1,[m
    "id": "ef357e94",[m
    "metadata": {},[m
    "outputs": [],[m
    "source": [[m
     "import pandas as pd\n",[m
     "import matplotlib.pyplot as plt\n",[m
[31m-    "from pathlib import Path\n",[m
[32m+[m[32m    "from pathlib import Path\n"[m
[32m+[m[32m   ][m
[32m+[m[32m  },[m
[32m+[m[32m  {[m
[32m+[m[32m   "cell_type": "code",[m
[32m+[m[32m   "execution_count": 2,[m
[32m+[m[32m   "id": "70a112b5-92ab-4e5e-acb4-0a5ec9f7f241",[m
[32m+[m[32m   "metadata": {},[m
[32m+[m[32m   "outputs": [],[m
[32m+[m[32m   "source": [[m
[32m+[m[32m    "DATA_DIR = Path.cwd().parents[0] / \"Data\"  # adjust if needed\n",[m
[32m+[m[32m    "\n",[m
[32m+[m[32m    "def load_csv(filename: str) -> pd.DataFrame:\n",[m
[32m+[m[32m    "    fp = DATA_DIR / filename\n",[m
[32m+[m[32m    "\n",[m
[32m+[m[32m    "    if fp.exists():\n",[m
[32m+[m[32m    "        print(f\"Loaded: {fp}\")\n",[m
[32m+[m[32m    "        return pd.read_csv(fp)\n",[m
[32m+[m[32m    "    raise FileNotFoundError(\n",[m
[32m+[m[32m    "        f\"Could not find {filename} in any of: {[str(d) for d in DATA_DIR]}\"\n",[m
[32m+[m[32m    "    )\n"[m
[32m+[m[32m   ][m
[32m+[m[32m  },[m
[32m+[m[32m  {[m
[32m+[m[32m   "cell_type": "code",[m
[32m+[m[32m   "execution_count": 3,[m
[32m+[m[32m   "id": "840ef3ca-5ce1-4849-b1a0-d03491870404",[m
[32m+[m[32m   "metadata": {},[m
[32m+[m[32m   "outputs": [[m
[32m+[m[32m    {[m
[32m+[m[32m     "name": "stdout",[m
[32m+[m[32m     "output_type": "stream",[m
[32m+[m[32m     "text": [[m
[32m+[m[32m      "Loaded: /home/csantosh/Build_Projects/streaming-bi-template/Data/MoviesOnStreamingPlatforms.csv\n",[m
[32m+[m[32m      "Loaded: /home/csantosh/Build_Projects/streaming-bi-template/Data/TVShowsOnStreamingPlatforms.csv\n",[m
[32m+[m[32m      "df_movie_shape: (9515, 15)\n",[m
[32m+[m[32m      "df_tv shape: (5368, 15)\n"[m
[32m+[m[32m     ][m
[32m+[m[32m    }[m
[32m+[m[32m   ],[m
[32m+[m[32m   "source": [[m
[32m+[m[32m    "df_movie = load_csv(\"MoviesOnStreamingPlatforms.csv\")\n",[m
[32m+[m[32m    "df_tv = load_csv(\"TVShowsOnStreamingPlatforms.csv\")\n",[m
     "\n",[m
[31m-    "DATA_DIR = Path.cwd().parents[0] / \"data\"  # adjust if needed\n",[m
[32m+[m[32m    "print(\"df_movie_shape:\", df_movie.shape)\n",[m
[32m+[m[32m    "print(\"df_tv shape:\", df_tv.shape)\n"[m
[32m+[m[32m   ][m
[32m+[m[32m  },[m
[32m+[m[32m  {[m
[32m+[m[32m   "cell_type": "code",[m
[32m+[m[32m   "execution_count": 5,[m
[32m+[m[32m   "id": "9a6f2c83-8d4c-43b6-8fb2-9e92e4a1eb26",[m
[32m+[m[32m   "metadata": {},[m
[32m+[m[32m   "outputs": [[m
[32m+[m[32m    {[m
[32m+[m[32m     "data": {[m
[32m+[m[32m      "text/html": [[m
[32m+[m[32m       "<div>\n",[m
[32m+[m[32m       "<style scoped>\n",[m
[32m+[m[32m       "    .dataframe tbody tr th:only-of-type {\n",[m
[32m+[m[32m       "        vertical-align: middle;\n",[m
[32m+[m[32m       "    }\n",[m
[32m+[m[32m       "\n",[m
[32m+[m[32m       "    .dataframe tbody tr th {\n",[m
[32m+[m[32m       "        vertical-align: top;\n",[m
[32m+[m[32m       "    }\n",[m
[32m+[m[32m       "\n",[m
[32m+[m[32m       "    .dataframe thead th {\n",[m
[32m+[m[32m       "        text-align: right;\n",[m
[32m+[m[32m       "    }\n",[m
[32m+[m[32m       "</style>\n",[m
[32m+[m[32m       "<table border=\"1\" class=\"dataframe\">\n",[m
[32m+[m[32m       "  <thead>\n",[m
[32m+[m[32m       "    <tr style=\"text-align: right;\">\n",[m
[32m+[m[32m       "      <th></th>\n",[m
[32m+[m[32m       "      <th>ID</th>\n",[m
[32m+[m[32m       "      <th>Title</th>\n",[m
[32m+[m[32m       "      <th>Year</th>\n",[m
[32m+[m[32m       "      <th>Age</th>\n",[m
[32m+[m[32m       "      <th>Rotten Tomatoes</th>\n",[m
[32m+[m[32m       "      <th>Netflix</th>\n",[m
[32m+[m[32m       "      <th>Hulu</th>\n",[m
[32m+[m[32m       "      <th>Prime Video</th>\n",[m
[32m+[m[32m       "      <th>Disney+</th>\n",[m
[32m+[m[32m       "      <th>Type</th>\n",[m
[32m+[m[32m       "      <th>Genre</th>\n",[m
[32m+[m[32m       "      <th>Country</th>\n",[m
[32m+[m[32m       "      <th>Language</th>\n",[m
[32m+[m[32m       "      <th>IMDb</th>\n",[m
[32m+[m[32m       "      <th>IMDb_ID</th>\n",[m
[32m+[m[32m       "    </tr>\n",[m
[32m+[m[32m       "  </thead>\n",[m
[32m+[m[32m       "  <tbody>\n",[m
[32m+[m[32m       "    <tr>\n",[m
[32m+[m[32m       "      <th>0</th>\n",[m
[32m+[m[32m       "      <td>1</td>\n",[m
[32m+[m[32m       "      <td>The Irishman</td>\n",[m
[32m+[m[32m       "      <td>2019</td>\n",[m
[32m+[m[32m       "      <td>18+</td>\n",[m
[32m+[m[32m       "      <td>98/100</td>\n",[m
[32m+[m[32m       "      <td>1</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>Biography, Crime, Drama</td>\n",[m
[32m+[m[32m       "      <td>United States</td>\n",[m
[32m+[m[32m       "      <td>English, Italian, Latin, Spanish, German</td>\n",[m
[32m+[m[32m       "      <td>7.8</td>\n",[m
[32m+[m[32m       "      <td>tt1302006</td>\n",[m
[32m+[m[32m       "    </tr>\n",[m
[32m+[m[32m       "    <tr>\n",[m
[32m+[m[32m       "      <th>1</th>\n",[m
[32m+[m[32m       "      <td>2</td>\n",[m
[32m+[m[32m       "      <td>Dangal</td>\n",[m
[32m+[m[32m       "      <td>2016</td>\n",[m
[32m+[m[32m       "      <td>7+</td>\n",[m
[32m+[m[32m       "      <td>97/100</td>\n",[m
[32m+[m[32m       "      <td>1</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>Action, Biography, Drama</td>\n",[m
[32m+[m[32m       "      <td>India, United States</td>\n",[m
[32m+[m[32m       "      <td>Hindi, English</td>\n",[m
[32m+[m[32m       "      <td>8.3</td>\n",[m
[32m+[m[32m       "      <td>tt5074352</td>\n",[m
[32m+[m[32m       "    </tr>\n",[m
[32m+[m[32m       "    <tr>\n",[m
[32m+[m[32m       "      <th>2</th>\n",[m
[32m+[m[32m       "      <td>3</td>\n",[m
[32m+[m[32m       "      <td>David Attenborough: A Life on Our Planet</td>\n",[m
[32m+[m[32m       "      <td>2020</td>\n",[m
[32m+[m[32m       "      <td>7+</td>\n",[m
[32m+[m[32m       "      <td>95/100</td>\n",[m
[32m+[m[32m       "      <td>1</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>Documentary, Biography</td>\n",[m
[32m+[m[32m       "      <td>United Kingdom</td>\n",[m
[32m+[m[32m       "      <td>English</td>\n",[m
[32m+[m[32m       "      <td>8.9</td>\n",[m
[32m+[m[32m       "      <td>tt11989890</td>\n",[m
[32m+[m[32m       "    </tr>\n",[m
[32m+[m[32m       "    <tr>\n",[m
[32m+[m[32m       "      <th>3</th>\n",[m
[32m+[m[32m       "      <td>4</td>\n",[m
[32m+[m[32m       "      <td>Lagaan: Once Upon a Time in India</td>\n",[m
[32m+[m[32m       "      <td>2001</td>\n",[m
[32m+[m[32m       "      <td>7+</td>\n",[m
[32m+[m[32m       "      <td>94/100</td>\n",[m
[32m+[m[32m       "      <td>1</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>Drama, Musical, Sport</td>\n",[m
[32m+[m[32m       "      <td>India, United States</td>\n",[m
[32m+[m[32m       "      <td>Hindi, English</td>\n",[m
[32m+[m[32m       "      <td>8.1</td>\n",[m
[32m+[m[32m       "      <td>tt0169102</td>\n",[m
[32m+[m[32m       "    </tr>\n",[m
[32m+[m[32m       "    <tr>\n",[m
[32m+[m[32m       "      <th>4</th>\n",[m
[32m+[m[32m       "      <td>5</td>\n",[m
[32m+[m[32m       "      <td>Roma</td>\n",[m
[32m+[m[32m       "      <td>2018</td>\n",[m
[32m+[m[32m       "      <td>18+</td>\n",[m
[32m+[m[32m       "      <td>94/100</td>\n",[m
[32m+[m[32m       "      <td>1</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>Drama</td>\n",[m
[32m+[m[32m       "      <td>Mexico, United States</td>\n",[m
[32m+[m[32m       "      <td>Spanish, Mixtec, English, Japanese, German, Fr...</td>\n",[m
[32m+[m[32m       "      <td>7.6</td>\n",[m
[32m+[m[32m       "      <td>tt6155172</td>\n",[m
[32m+[m[32m       "    </tr>\n",[m
[32m+[m[32m       "  </tbody>\n",[m
[32m+[m[32m       "</table>\n",[m
[32m+[m[32m       "</div>"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "text/plain": [[m
[32m+[m[32m       "   ID                                     Title  Year  Age Rotten Tomatoes  \\\n",[m
[32m+[m[32m       "0   1                              The Irishman  2019  18+          98/100   \n",[m
[32m+[m[32m       "1   2                                    Dangal  2016   7+          97/100   \n",[m
[32m+[m[32m       "2   3  David Attenborough: A Life on Our Planet  2020   7+          95/100   \n",[m
[32m+[m[32m       "3   4         Lagaan: Once Upon a Time in India  2001   7+          94/100   \n",[m
[32m+[m[32m       "4   5                                      Roma  2018  18+          94/100   \n",[m
[32m+[m[32m       "\n",[m
[32m+[m[32m       "   Netflix  Hulu  Prime Video  Disney+  Type                     Genre  \\\n",[m
[32m+[m[32m       "0        1     0            0        0     0   Biography, Crime, Drama   \n",[m
[32m+[m[32m       "1        1     0            0        0     0  Action, Biography, Drama   \n",[m
[32m+[m[32m       "2        1     0            0        0     0    Documentary, Biography   \n",[m
[32m+[m[32m       "3        1     0            0        0     0     Drama, Musical, Sport   \n",[m
[32m+[m[32m       "4        1     0            0        0     0                     Drama   \n",[m
[32m+[m[32m       "\n",[m
[32m+[m[32m       "                 Country                                           Language  \\\n",[m
[32m+[m[32m       "0          United States           English, Italian, Latin, Spanish, German   \n",[m
[32m+[m[32m       "1   India, United States                                     Hindi, English   \n",[m
[32m+[m[32m       "2         United Kingdom                                            English   \n",[m
[32m+[m[32m       "3   India, United States                                     Hindi, English   \n",[m
[32m+[m[32m       "4  Mexico, United States  Spanish, Mixtec, English, Japanese, German, Fr...   \n",[m
[32m+[m[32m       "\n",[m
[32m+[m[32m       "   IMDb     IMDb_ID  \n",[m
[32m+[m[32m       "0   7.8   tt1302006  \n",[m
[32m+[m[32m       "1   8.3   tt5074352  \n",[m
[32m+[m[32m       "2   8.9  tt11989890  \n",[m
[32m+[m[32m       "3   8.1   tt0169102  \n",[m
[32m+[m[32m       "4   7.6   tt6155172  "[m
[32m+[m[32m      ][m
[32m+[m[32m     },[m
[32m+[m[32m     "execution_count": 5,[m
[32m+[m[32m     "metadata": {},[m
[32m+[m[32m     "output_type": "execute_result"[m
[32m+[m[32m    }[m
[32m+[m[32m   ],[m
[32m+[m[32m   "source": [[m
[32m+[m[32m    "df_movie.head()"[m
[32m+[m[32m   ][m
[32m+[m[32m  },[m
[32m+[m[32m  {[m
[32m+[m[32m   "cell_type": "code",[m
[32m+[m[32m   "execution_count": 6,[m
[32m+[m[32m   "id": "c4e84e0b-d745-454e-8c49-d844a6652c65",[m
[32m+[m[32m   "metadata": {},[m
[32m+[m[32m   "outputs": [[m
[32m+[m[32m    {[m
[32m+[m[32m     "name": "stdout",[m
[32m+[m[32m     "output_type": "stream",[m
[32m+[m[32m     "text": [[m
[32m+[m[32m      "Place your dataset (e.g., svod_sample.csv) in the data/ folder.\n"[m
[32m+[m[32m     ][m
[32m+[m[32m    }[m
[32m+[m[32m   ],[m
[32m+[m[32m   "source": [[m
     "# Example: df = pd.read_csv(DATA_DIR / \"svod_sample.csv\")\n",[m
     "print(\"Place your dataset (e.g., svod_sample.csv) in the data/ folder.\")"[m
    ][m
   },[m
[32m+[m[32m  {[m
[32m+[m[32m   "cell_type": "markdown",[m
[32m+[m[32m   "id": "0b402234-9464-4a33-985f-dd9a2bf9160f",[m
[32m+[m[32m   "metadata": {},[m
[32m+[m[32m   "source": [[m
[32m+[m[32m    "### Explore movie data"[m
[32m+[m[32m   ][m
[32m+[m[32m  },[m
[32m+[m[32m  {[m
[32m+[m[32m   "cell_type": "code",[m
[32m+[m[32m   "execution_count": 7,[m
[32m+[m[32m   "id": "7f440a6a-8e94-445d-b978-117e15d311d9",[m
[32m+[m[32m   "metadata": {},[m
[32m+[m[32m   "outputs": [[m
[32m+[m[32m    {[m
[32m+[m[32m     "data": {[m
[32m+[m[32m      "text/html": [[m
[32m+[m[32m       "<div>\n",[m
[32m+[m[32m       "<style scoped>\n",[m
[32m+[m[32m       "    .dataframe tbody tr th:only-of-type {\n",[m
[32m+[m[32m       "        vertical-align: middle;\n",[m
[32m+[m[32m       "    }\n",[m
[32m+[m[32m       "\n",[m
[32m+[m[32m       "    .dataframe tbody tr th {\n",[m
[32m+[m[32m       "        vertical-align: top;\n",[m
[32m+[m[32m       "    }\n",[m
[32m+[m[32m       "\n",[m
[32m+[m[32m       "    .dataframe thead th {\n",[m
[32m+[m[32m       "        text-align: right;\n",[m
[32m+[m[32m       "    }\n",[m
[32m+[m[32m       "</style>\n",[m
[32m+[m[32m       "<table border=\"1\" class=\"dataframe\">\n",[m
[32m+[m[32m       "  <thead>\n",[m
[32m+[m[32m       "    <tr style=\"text-align: right;\">\n",[m
[32m+[m[32m       "      <th></th>\n",[m
[32m+[m[32m       "      <th>ID</th>\n",[m
[32m+[m[32m       "      <th>Title</th>\n",[m
[32m+[m[32m       "      <th>Year</th>\n",[m
[32m+[m[32m       "      <th>Age</th>\n",[m
[32m+[m[32m       "      <th>Rotten Tomatoes</th>\n",[m
[32m+[m[32m       "      <th>Netflix</th>\n",[m
[32m+[m[32m       "      <th>Hulu</th>\n",[m
[32m+[m[32m       "      <th>Prime Video</th>\n",[m
[32m+[m[32m       "      <th>Disney+</th>\n",[m
[32m+[m[32m       "      <th>Type</th>\n",[m
[32m+[m[32m       "      <th>Genre</th>\n",[m
[32m+[m[32m       "      <th>Country</th>\n",[m
[32m+[m[32m       "      <th>Language</th>\n",[m
[32m+[m[32m       "      <th>IMDb</th>\n",[m
[32m+[m[32m       "      <th>IMDb_ID</th>\n",[m
[32m+[m[32m       "    </tr>\n",[m
[32m+[m[32m       "  </thead>\n",[m
[32m+[m[32m       "  <tbody>\n",[m
[32m+[m[32m       "    <tr>\n",[m
[32m+[m[32m       "      <th>0</th>\n",[m
[32m+[m[32m       "      <td>1</td>\n",[m
[32m+[m[32m       "      <td>The Irishman</td>\n",[m
[32m+[m[32m       "      <td>2019</td>\n",[m
[32m+[m[32m       "      <td>18+</td>\n",[m
[32m+[m[32m       "      <td>98/100</td>\n",[m
[32m+[m[32m       "      <td>1</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>Biography, Crime, Drama</td>\n",[m
[32m+[m[32m       "      <td>United States</td>\n",[m
[32m+[m[32m       "      <td>English, Italian, Latin, Spanish, German</td>\n",[m
[32m+[m[32m       "      <td>7.8</td>\n",[m
[32m+[m[32m       "      <td>tt1302006</td>\n",[m
[32m+[m[32m       "    </tr>\n",[m
[32m+[m[32m       "    <tr>\n",[m
[32m+[m[32m       "      <th>1</th>\n",[m
[32m+[m[32m       "      <td>2</td>\n",[m
[32m+[m[32m       "      <td>Dangal</td>\n",[m
[32m+[m[32m       "      <td>2016</td>\n",[m
[32m+[m[32m       "      <td>7+</td>\n",[m
[32m+[m[32m       "      <td>97/100</td>\n",[m
[32m+[m[32m       "      <td>1</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>Action, Biography, Drama</td>\n",[m
[32m+[m[32m       "      <td>India, United States</td>\n",[m
[32m+[m[32m       "      <td>Hindi, English</td>\n",[m
[32m+[m[32m       "      <td>8.3</td>\n",[m
[32m+[m[32m       "      <td>tt5074352</td>\n",[m
[32m+[m[32m       "    </tr>\n",[m
[32m+[m[32m       "    <tr>\n",[m
[32m+[m[32m       "      <th>2</th>\n",[m
[32m+[m[32m       "      <td>3</td>\n",[m
[32m+[m[32m       "      <td>David Attenborough: A Life on Our Planet</td>\n",[m
[32m+[m[32m       "      <td>2020</td>\n",[m
[32m+[m[32m       "      <td>7+</td>\n",[m
[32m+[m[32m       "      <td>95/100</td>\n",[m
[32m+[m[32m       "      <td>1</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>Documentary, Biography</td>\n",[m
[32m+[m[32m       "      <td>United Kingdom</td>\n",[m
[32m+[m[32m       "      <td>English</td>\n",[m
[32m+[m[32m       "      <td>8.9</td>\n",[m
[32m+[m[32m       "      <td>tt11989890</td>\n",[m
[32m+[m[32m       "    </tr>\n",[m
[32m+[m[32m       "    <tr>\n",[m
[32m+[m[32m       "      <th>3</th>\n",[m
[32m+[m[32m       "      <td>4</td>\n",[m
[32m+[m[32m       "      <td>Lagaan: Once Upon a Time in India</td>\n",[m
[32m+[m[32m       "      <td>2001</td>\n",[m
[32m+[m[32m       "      <td>7+</td>\n",[m
[32m+[m[32m       "      <td>94/100</td>\n",[m
[32m+[m[32m       "      <td>1</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>Drama, Musical, Sport</td>\n",[m
[32m+[m[32m       "      <td>India, United States</td>\n",[m
[32m+[m[32m       "      <td>Hindi, English</td>\n",[m
[32m+[m[32m       "      <td>8.1</td>\n",[m
[32m+[m[32m       "      <td>tt0169102</td>\n",[m
[32m+[m[32m       "    </tr>\n",[m
[32m+[m[32m       "    <tr>\n",[m
[32m+[m[32m       "      <th>4</th>\n",[m
[32m+[m[32m       "      <td>5</td>\n",[m
[32m+[m[32m       "      <td>Roma</td>\n",[m
[32m+[m[32m       "      <td>2018</td>\n",[m
[32m+[m[32m       "      <td>18+</td>\n",[m
[32m+[m[32m       "      <td>94/100</td>\n",[m
[32m+[m[32m       "      <td>1</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>Drama</td>\n",[m
[32m+[m[32m       "      <td>Mexico, United States</td>\n",[m
[32m+[m[32m       "      <td>Spanish, Mixtec, English, Japanese, German, Fr...</td>\n",[m
[32m+[m[32m       "      <td>7.6</td>\n",[m
[32m+[m[32m       "      <td>tt6155172</td>\n",[m
[32m+[m[32m       "    </tr>\n",[m
[32m+[m[32m       "  </tbody>\n",[m
[32m+[m[32m       "</table>\n",[m
[32m+[m[32m       "</div>"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "text/plain": [[m
[32m+[m[32m       "   ID                                     Title  Year  Age Rotten Tomatoes  \\\n",[m
[32m+[m[32m       "0   1                              The Irishman  2019  18+          98/100   \n",[m
[32m+[m[32m       "1   2                                    Dangal  2016   7+          97/100   \n",[m
[32m+[m[32m       "2   3  David Attenborough: A Life on Our Planet  2020   7+          95/100   \n",[m
[32m+[m[32m       "3   4         Lagaan: Once Upon a Time in India  2001   7+          94/100   \n",[m
[32m+[m[32m       "4   5                                      Roma  2018  18+          94/100   \n",[m
[32m+[m[32m       "\n",[m
[32m+[m[32m       "   Netflix  Hulu  Prime Video  Disney+  Type                     Genre  \\\n",[m
[32m+[m[32m       "0        1     0            0        0     0   Biography, Crime, Drama   \n",[m
[32m+[m[32m       "1        1     0            0        0     0  Action, Biography, Drama   \n",[m
[32m+[m[32m       "2        1     0            0        0     0    Documentary, Biography   \n",[m
[32m+[m[32m       "3        1     0            0        0     0     Drama, Musical, Sport   \n",[m
[32m+[m[32m       "4        1     0            0        0     0                     Drama   \n",[m
[32m+[m[32m       "\n",[m
[32m+[m[32m       "                 Country                                           Language  \\\n",[m
[32m+[m[32m       "0          United States           English, Italian, Latin, Spanish, German   \n",[m
[32m+[m[32m       "1   India, United States                                     Hindi, English   \n",[m
[32m+[m[32m       "2         United Kingdom                                            English   \n",[m
[32m+[m[32m       "3   India, United States                                     Hindi, English   \n",[m
[32m+[m[32m       "4  Mexico, United States  Spanish, Mixtec, English, Japanese, German, Fr...   \n",[m
[32m+[m[32m       "\n",[m
[32m+[m[32m       "   IMDb     IMDb_ID  \n",[m
[32m+[m[32m       "0   7.8   tt1302006  \n",[m
[32m+[m[32m       "1   8.3   tt5074352  \n",[m
[32m+[m[32m       "2   8.9  tt11989890  \n",[m
[32m+[m[32m       "3   8.1   tt0169102  \n",[m
[32m+[m[32m       "4   7.6   tt6155172  "[m
[32m+[m[32m      ][m
[32m+[m[32m     },[m
[32m+[m[32m     "execution_count": 7,[m
[32m+[m[32m     "metadata": {},[m
[32m+[m[32m     "output_type": "execute_result"[m
[32m+[m[32m    }[m
[32m+[m[32m   ],[m
[32m+[m[32m   "source": [[m
[32m+[m[32m    "df_movie.head()"[m
[32m+[m[32m   ][m
[32m+[m[32m  },[m
[32m+[m[32m  {[m
[32m+[m[32m   "cell_type": "code",[m
[32m+[m[32m   "execution_count": 8,[m
[32m+[m[32m   "id": "a6b2d237-fb10-4c8e-b6f6-0667ad0094a5",[m
[32m+[m[32m   "metadata": {},[m
[32m+[m[32m   "outputs": [[m
[32m+[m[32m    {[m
[32m+[m[32m     "name": "stdout",[m
[32m+[m[32m     "output_type": "stream",[m
[32m+[m[32m     "text": [[m
[32m+[m[32m      "<class 'pandas.DataFrame'>\n",[m
[32m+[m[32m      "RangeIndex: 9515 entries, 0 to 9514\n",[m
[32m+[m[32m      "Data columns (total 15 columns):\n",[m
[32m+[m[32m      " #   Column           Non-Null Count  Dtype  \n",[m
[32m+[m[32m      "---  ------           --------------  -----  \n",[m
[32m+[m[32m      " 0   ID               9515 non-null   int64  \n",[m
[32m+[m[32m      " 1   Title            9515 non-null   str    \n",[m
[32m+[m[32m      " 2   Year             9515 non-null   int64  \n",[m
[32m+[m[32m      " 3   Age              5338 non-null   str    \n",[m
[32m+[m[32m      " 4   Rotten Tomatoes  9508 non-null   str    \n",[m
[32m+[m[32m      " 5   Netflix          9515 non-null   int64  \n",[m
[32m+[m[32m      " 6   Hulu             9515 non-null   int64  \n",[m
[32m+[m[32m      " 7   Prime Video      9515 non-null   int64  \n",[m
[32m+[m[32m      " 8   Disney+          9515 non-null   int64  \n",[m
[32m+[m[32m      " 9   Type             9515 non-null   int64  \n",[m
[32m+[m[32m      " 10  Genre            6030 non-null   str    \n",[m
[32m+[m[32m      " 11  Country          6387 non-null   str    \n",[m
[32m+[m[32m      " 12  Language         6026 non-null   str    \n",[m
[32m+[m[32m      " 13  IMDb             6732 non-null   float64\n",[m
[32m+[m[32m      " 14  IMDb_ID          6787 non-null   str    \n",[m
[32m+[m[32m      "dtypes: float64(1), int64(7), str(7)\n",[m
[32m+[m[32m      "memory usage: 1.1 MB\n"[m
[32m+[m[32m     ][m
[32m+[m[32m    }[m
[32m+[m[32m   ],[m
[32m+[m[32m   "source": [[m
[32m+[m[32m    "df_movie.info()"[m
[32m+[m[32m   ][m
[32m+[m[32m  },[m
[32m+[m[32m  {[m
[32m+[m[32m   "cell_type": "code",[m
[32m+[m[32m   "execution_count": 9,[m
[32m+[m[32m   "id": "bc708b3b-c2af-4aa3-a123-db6261273e65",[m
[32m+[m[32m   "metadata": {},[m
[32m+[m[32m   "outputs": [[m
[32m+[m[32m    {[m
[32m+[m[32m     "data": {[m
[32m+[m[32m      "text/html": [[m
[32m+[m[32m       "<div>\n",[m
[32m+[m[32m       "<style scoped>\n",[m
[32m+[m[32m       "    .dataframe tbody tr th:only-of-type {\n",[m
[32m+[m[32m       "        vertical-align: middle;\n",[m
[32m+[m[32m       "    }\n",[m
[32m+[m[32m       "\n",[m
[32m+[m[32m       "    .dataframe tbody tr th {\n",[m
[32m+[m[32m       "        vertical-align: top;\n",[m
[32m+[m[32m       "    }\n",[m
[32m+[m[32m       "\n",[m
[32m+[m[32m       "    .dataframe thead th {\n",[m
[32m+[m[32m       "        text-align: right;\n",[m
[32m+[m[32m       "    }\n",[m
[32m+[m[32m       "</style>\n",[m
[32m+[m[32m       "<table border=\"1\" class=\"dataframe\">\n",[m
[32m+[m[32m       "  <thead>\n",[m
[32m+[m[32m       "    <tr style=\"text-align: right;\">\n",[m
[32m+[m[32m       "      <th></th>\n",[m
[32m+[m[32m       "      <th>ID</th>\n",[m
[32m+[m[32m       "      <th>Year</th>\n",[m
[32m+[m[32m       "      <th>Netflix</th>\n",[m
[32m+[m[32m       "      <th>Hulu</th>\n",[m
[32m+[m[32m       "      <th>Prime Video</th>\n",[m
[32m+[m[32m       "      <th>Disney+</th>\n",[m
[32m+[m[32m       "      <th>Type</th>\n",[m
[32m+[m[32m       "      <th>IMDb</th>\n",[m
[32m+[m[32m       "    </tr>\n",[m
[32m+[m[32m       "  </thead>\n",[m
[32m+[m[32m       "  <tbody>\n",[m
[32m+[m[32m       "    <tr>\n",[m
[32m+[m[32m       "      <th>count</th>\n",[m
[32m+[m[32m       "      <td>9515.000000</td>\n",[m
[32m+[m[32m       "      <td>9515.000000</td>\n",[m
[32m+[m[32m       "      <td>9515.000000</td>\n",[m
[32m+[m[32m       "      <td>9515.000000</td>\n",[m
[32m+[m[32m       "      <td>9515.000000</td>\n",[m
[32m+[m[32m       "      <td>9515.000000</td>\n",[m
[32m+[m[32m       "      <td>9515.0</td>\n",[m
[32m+[m[32m       "      <td>6732.000000</td>\n",[m
[32m+[m[32m       "    </tr>\n",[m
[32m+[m[32m       "    <tr>\n",[m
[32m+[m[32m       "      <th>mean</th>\n",[m
[32m+[m[32m       "      <td>4758.000000</td>\n",[m
[32m+[m[32m       "      <td>2007.422386</td>\n",[m
[32m+[m[32m       "      <td>0.388334</td>\n",[m
[32m+[m[32m       "      <td>0.110037</td>\n",[m
[32m+[m[32m       "      <td>0.432265</td>\n",[m
[32m+[m[32m       "      <td>0.096900</td>\n",[m
[32m+[m[32m       "      <td>0.0</td>\n",[m
[32m+[m[32m       "      <td>6.604947</td>\n",[m
[32m+[m[32m       "    </tr>\n",[m
[32m+[m[32m       "    <tr>\n",[m
[32m+[m[32m       "      <th>std</th>\n",[m
[32m+[m[32m       "      <td>2746.888239</td>\n",[m
[32m+[m[32m       "      <td>19.130367</td>\n",[m
[32m+[m[32m       "      <td>0.487397</td>\n",[m
[32m+[m[32m       "      <td>0.312952</td>\n",[m
[32m+[m[32m       "      <td>0.495417</td>\n",[m
[32m+[m[32m       "      <td>0.295837</td>\n",[m
[32m+[m[32m       "      <td>0.0</td>\n",[m
[32m+[m[32m       "      <td>2.148151</td>\n",[m
[32m+[m[32m       "    </tr>\n",[m
[32m+[m[32m       "    <tr>\n",[m
[32m+[m[32m       "      <th>min</th>\n",[m
[32m+[m[32m       "      <td>1.000000</td>\n",[m
[32m+[m[32m       "      <td>1914.000000</td>\n",[m
[32m+[m[32m       "      <td>0.000000</td>\n",[m
[32m+[m[32m       "      <td>0.000000</td>\n",[m
[32m+[m[32m       "      <td>0.000000</td>\n",[m
[32m+[m[32m       "      <td>0.000000</td>\n",[m
[32m+[m[32m       "      <td>0.0</td>\n",[m
[32m+[m[32m       "      <td>1.000000</td>\n",[m
[32m+[m[32m       "    </tr>\n",[m
[32m+[m[32m       "    <tr>\n",[m
[32m+[m[32m       "      <th>25%</th>\n",[m
[32m+[m[32m       "      <td>2379.500000</td>\n",[m
[32m+[m[32m       "      <td>2006.000000</td>\n",[m
[32m+[m[32m       "      <td>0.000000</td>\n",[m
[32m+[m[32m       "      <td>0.000000</td>\n",[m
[32m+[m[32m       "      <td>0.000000</td>\n",[m
[32m+[m[32m       "      <td>0.000000</td>\n",[m
[32m+[m[32m       "      <td>0.0</td>\n",[m
[32m+[m[32m       "      <td>5.800000</td>\n",[m
[32m+[m[32m       "    </tr>\n",[m
[32m+[m[32m       "    <tr>\n",[m
[32m+[m[32m       "      <th>50%</th>\n",[m
[32m+[m[32m       "      <td>4758.000000</td>\n",[m
[32m+[m[32m       "      <td>2015.000000</td>\n",[m
[32m+[m[32m       "      <td>0.000000</td>\n",[m
[32m+[m[32m       "      <td>0.000000</td>\n",[m
[32m+[m[32m       "      <td>0.000000</td>\n",[m
[32m+[m[32m       "      <td>0.000000</td>\n",[m
[32m+[m[32m       "      <td>0.0</td>\n",[m
[32m+[m[32m       "      <td>7.000000</td>\n",[m
[32m+[m[32m       "    </tr>\n",[m
[32m+[m[32m       "    <tr>\n",[m
[32m+[m[32m       "      <th>75%</th>\n",[m
[32m+[m[32m       "      <td>7136.500000</td>\n",[m
[32m+[m[32m       "      <td>2018.000000</td>\n",[m
[32m+[m[32m       "      <td>1.000000</td>\n",[m
[32m+[m[32m       "      <td>0.000000</td>\n",[m
[32m+[m[32m       "      <td>1.000000</td>\n",[m
[32m+[m[32m       "      <td>0.000000</td>\n",[m
[32m+[m[32m       "      <td>0.0</td>\n",[m
[32m+[m[32m       "      <td>8.000000</td>\n",[m
[32m+[m[32m       "    </tr>\n",[m
[32m+[m[32m       "    <tr>\n",[m
[32m+[m[32m       "      <th>max</th>\n",[m
[32m+[m[32m       "      <td>9515.000000</td>\n",[m
[32m+[m[32m       "      <td>2021.000000</td>\n",[m
[32m+[m[32m       "      <td>1.000000</td>\n",[m
[32m+[m[32m       "      <td>1.000000</td>\n",[m
[32m+[m[32m       "      <td>1.000000</td>\n",[m
[32m+[m[32m       "      <td>1.000000</td>\n",[m
[32m+[m[32m       "      <td>0.0</td>\n",[m
[32m+[m[32m       "      <td>10.000000</td>\n",[m
[32m+[m[32m       "    </tr>\n",[m
[32m+[m[32m       "  </tbody>\n",[m
[32m+[m[32m       "</table>\n",[m
[32m+[m[32m       "</div>"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "text/plain": [[m
[32m+[m[32m       "                ID         Year      Netflix         Hulu  Prime Video  \\\n",[m
[32m+[m[32m       "count  9515.000000  9515.000000  9515.000000  9515.000000  9515.000000   \n",[m
[32m+[m[32m       "mean   4758.000000  2007.422386     0.388334     0.110037     0.432265   \n",[m
[32m+[m[32m       "std    2746.888239    19.130367     0.487397     0.312952     0.495417   \n",[m
[32m+[m[32m       "min       1.000000  1914.000000     0.000000     0.000000     0.000000   \n",[m
[32m+[m[32m       "25%    2379.500000  2006.000000     0.000000     0.000000     0.000000   \n",[m
[32m+[m[32m       "50%    4758.000000  2015.000000     0.000000     0.000000     0.000000   \n",[m
[32m+[m[32m       "75%    7136.500000  2018.000000     1.000000     0.000000     1.000000   \n",[m
[32m+[m[32m       "max    9515.000000  2021.000000     1.000000     1.000000     1.000000   \n",[m
[32m+[m[32m       "\n",[m
[32m+[m[32m       "           Disney+    Type         IMDb  \n",[m
[32m+[m[32m       "count  9515.000000  9515.0  6732.000000  \n",[m
[32m+[m[32m       "mean      0.096900     0.0     6.604947  \n",[m
[32m+[m[32m       "std       0.295837     0.0     2.148151  \n",[m
[32m+[m[32m       "min       0.000000     0.0     1.000000  \n",[m
[32m+[m[32m       "25%       0.000000     0.0     5.800000  \n",[m
[32m+[m[32m       "50%       0.000000     0.0     7.000000  \n",[m
[32m+[m[32m       "75%       0.000000     0.0     8.000000  \n",[m
[32m+[m[32m       "max       1.000000     0.0    10.000000  "[m
[32m+[m[32m      ][m
[32m+[m[32m     },[m
[32m+[m[32m     "execution_count": 9,[m
[32m+[m[32m     "metadata": {},[m
[32m+[m[32m     "output_type": "execute_result"[m
[32m+[m[32m    }[m
[32m+[m[32m   ],[m
[32m+[m[32m   "source": [[m
[32m+[m[32m    "df_movie.describe()"[m
[32m+[m[32m   ][m
[32m+[m[32m  },[m
[32m+[m[32m  {[m
[32m+[m[32m   "cell_type": "markdown",[m
[32m+[m[32m   "id": "5daec030-a726-49f7-a1d2-0066f5d68197",[m
[32m+[m[32m   "metadata": {},[m
[32m+[m[32m   "source": [[m
[32m+[m[32m    "### Explore TV shows"[m
[32m+[m[32m   ][m
[32m+[m[32m  },[m
[32m+[m[32m  {[m
[32m+[m[32m   "cell_type": "code",[m
[32m+[m[32m   "execution_count": 10,[m
[32m+[m[32m   "id": "eecb10ca-e410-4ec2-8b0f-d604e88b7689",[m
[32m+[m[32m   "metadata": {},[m
[32m+[m[32m   "outputs": [[m
[32m+[m[32m    {[m
[32m+[m[32m     "data": {[m
[32m+[m[32m      "text/html": [[m
[32m+[m[32m       "<div>\n",[m
[32m+[m[32m       "<style scoped>\n",[m
[32m+[m[32m       "    .dataframe tbody tr th:only-of-type {\n",[m
[32m+[m[32m       "        vertical-align: middle;\n",[m
[32m+[m[32m       "    }\n",[m
[32m+[m[32m       "\n",[m
[32m+[m[32m       "    .dataframe tbody tr th {\n",[m
[32m+[m[32m       "        vertical-align: top;\n",[m
[32m+[m[32m       "    }\n",[m
[32m+[m[32m       "\n",[m
[32m+[m[32m       "    .dataframe thead th {\n",[m
[32m+[m[32m       "        text-align: right;\n",[m
[32m+[m[32m       "    }\n",[m
[32m+[m[32m       "</style>\n",[m
[32m+[m[32m       "<table border=\"1\" class=\"dataframe\">\n",[m
[32m+[m[32m       "  <thead>\n",[m
[32m+[m[32m       "    <tr style=\"text-align: right;\">\n",[m
[32m+[m[32m       "      <th></th>\n",[m
[32m+[m[32m       "      <th>ID</th>\n",[m
[32m+[m[32m       "      <th>Title</th>\n",[m
[32m+[m[32m       "      <th>Year</th>\n",[m
[32m+[m[32m       "      <th>Age</th>\n",[m
[32m+[m[32m       "      <th>Rotten Tomatoes</th>\n",[m
[32m+[m[32m       "      <th>Netflix</th>\n",[m
[32m+[m[32m       "      <th>Hulu</th>\n",[m
[32m+[m[32m       "      <th>Prime Video</th>\n",[m
[32m+[m[32m       "      <th>Disney+</th>\n",[m
[32m+[m[32m       "      <th>Type</th>\n",[m
[32m+[m[32m       "      <th>Genre</th>\n",[m
[32m+[m[32m       "      <th>Country</th>\n",[m
[32m+[m[32m       "      <th>Language</th>\n",[m
[32m+[m[32m       "      <th>IMDb</th>\n",[m
[32m+[m[32m       "      <th>IMDb_ID</th>\n",[m
[32m+[m[32m       "    </tr>\n",[m
[32m+[m[32m       "  </thead>\n",[m
[32m+[m[32m       "  <tbody>\n",[m
[32m+[m[32m       "    <tr>\n",[m
[32m+[m[32m       "      <th>0</th>\n",[m
[32m+[m[32m       "      <td>1</td>\n",[m
[32m+[m[32m       "      <td>Breaking Bad</td>\n",[m
[32m+[m[32m       "      <td>2008</td>\n",[m
[32m+[m[32m       "      <td>18+</td>\n",[m
[32m+[m[32m       "      <td>100/100</td>\n",[m
[32m+[m[32m       "      <td>1</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>1</td>\n",[m
[32m+[m[32m       "      <td>crime television series, drama television seri...</td>\n",[m
[32m+[m[32m       "      <td>United States</td>\n",[m
[32m+[m[32m       "      <td>American English, Spanish language in the Amer...</td>\n",[m
[32m+[m[32m       "      <td>10.0</td>\n",[m
[32m+[m[32m       "      <td>tt0903747</td>\n",[m
[32m+[m[32m       "    </tr>\n",[m
[32m+[m[32m       "    <tr>\n",[m
[32m+[m[32m       "      <th>1</th>\n",[m
[32m+[m[32m       "      <td>2</td>\n",[m
[32m+[m[32m       "      <td>Stranger Things</td>\n",[m
[32m+[m[32m       "      <td>2016</td>\n",[m
[32m+[m[32m       "      <td>16+</td>\n",[m
[32m+[m[32m       "      <td>96/100</td>\n",[m
[32m+[m[32m       "      <td>1</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>1</td>\n",[m
[32m+[m[32m       "      <td>science fiction television program, horror tel...</td>\n",[m
[32m+[m[32m       "      <td>United States</td>\n",[m
[32m+[m[32m       "      <td>English</td>\n",[m
[32m+[m[32m       "      <td>9.0</td>\n",[m
[32m+[m[32m       "      <td>tt4574334</td>\n",[m
[32m+[m[32m       "    </tr>\n",[m
[32m+[m[32m       "    <tr>\n",[m
[32m+[m[32m       "      <th>2</th>\n",[m
[32m+[m[32m       "      <td>3</td>\n",[m
[32m+[m[32m       "      <td>Attack on Titan</td>\n",[m
[32m+[m[32m       "      <td>2013</td>\n",[m
[32m+[m[32m       "      <td>18+</td>\n",[m
[32m+[m[32m       "      <td>95/100</td>\n",[m
[32m+[m[32m       "      <td>1</td>\n",[m
[32m+[m[32m       "      <td>1</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>1</td>\n",[m
[32m+[m[32m       "      <td>NaN</td>\n",[m
[32m+[m[32m       "      <td>NaN</td>\n",[m
[32m+[m[32m       "      <td>NaN</td>\n",[m
[32m+[m[32m       "      <td>9.0/10</td>\n",[m
[32m+[m[32m       "      <td>NaN</td>\n",[m
[32m+[m[32m       "    </tr>\n",[m
[32m+[m[32m       "    <tr>\n",[m
[32m+[m[32m       "      <th>3</th>\n",[m
[32m+[m[32m       "      <td>4</td>\n",[m
[32m+[m[32m       "      <td>Better Call Saul</td>\n",[m
[32m+[m[32m       "      <td>2015</td>\n",[m
[32m+[m[32m       "      <td>18+</td>\n",[m
[32m+[m[32m       "      <td>94/100</td>\n",[m
[32m+[m[32m       "      <td>1</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>1</td>\n",[m
[32m+[m[32m       "      <td>legal drama, crime television series</td>\n",[m
[32m+[m[32m       "      <td>United States</td>\n",[m
[32m+[m[32m       "      <td>English</td>\n",[m
[32m+[m[32m       "      <td>10.0</td>\n",[m
[32m+[m[32m       "      <td>tt3032476</td>\n",[m
[32m+[m[32m       "    </tr>\n",[m
[32m+[m[32m       "    <tr>\n",[m
[32m+[m[32m       "      <th>4</th>\n",[m
[32m+[m[32m       "      <td>5</td>\n",[m
[32m+[m[32m       "      <td>Dark</td>\n",[m
[32m+[m[32m       "      <td>2017</td>\n",[m
[32m+[m[32m       "      <td>16+</td>\n",[m
[32m+[m[32m       "      <td>93/100</td>\n",[m
[32m+[m[32m       "      <td>1</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>1</td>\n",[m
[32m+[m[32m       "      <td>science fiction television program, drama tele...</td>\n",[m
[32m+[m[32m       "      <td>Germany</td>\n",[m
[32m+[m[32m       "      <td>German</td>\n",[m
[32m+[m[32m       "      <td>10.0</td>\n",[m
[32m+[m[32m       "      <td>tt5753856</td>\n",[m
[32m+[m[32m       "    </tr>\n",[m
[32m+[m[32m       "  </tbody>\n",[m
[32m+[m[32m       "</table>\n",[m
[32m+[m[32m       "</div>"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "text/plain": [[m
[32m+[m[32m       "   ID             Title  Year  Age Rotten Tomatoes  Netflix  Hulu  \\\n",[m
[32m+[m[32m       "0   1      Breaking Bad  2008  18+         100/100        1     0   \n",[m
[32m+[m[32m       "1   2   Stranger Things  2016  16+          96/100        1     0   \n",[m
[32m+[m[32m       "2   3   Attack on Titan  2013  18+          95/100        1     1   \n",[m
[32m+[m[32m       "3   4  Better Call Saul  2015  18+          94/100        1     0   \n",[m
[32m+[m[32m       "4   5              Dark  2017  16+          93/100        1     0   \n",[m
[32m+[m[32m       "\n",[m
[32m+[m[32m       "   Prime Video  Disney+  Type  \\\n",[m
[32m+[m[32m       "0            0        0     1   \n",[m
[32m+[m[32m       "1            0        0     1   \n",[m
[32m+[m[32m       "2            0        0     1   \n",[m
[32m+[m[32m       "3            0        0     1   \n",[m
[32m+[m[32m       "4            0        0     1   \n",[m
[32m+[m[32m       "\n",[m
[32m+[m[32m       "                                               Genre        Country  \\\n",[m
[32m+[m[32m       "0  crime television series, drama television seri...  United States   \n",[m
[32m+[m[32m       "1  science fiction television program, horror tel...  United States   \n",[m
[32m+[m[32m       "2                                                NaN            NaN   \n",[m
[32m+[m[32m       "3               legal drama, crime television series  United States   \n",[m
[32m+[m[32m       "4  science fiction television program, drama tele...        Germany   \n",[m
[32m+[m[32m       "\n",[m
[32m+[m[32m       "                                            Language    IMDb    IMDb_ID  \n",[m
[32m+[m[32m       "0  American English, Spanish language in the Amer...    10.0  tt0903747  \n",[m
[32m+[m[32m       "1                                            English     9.0  tt4574334  \n",[m
[32m+[m[32m       "2                                                NaN  9.0/10        NaN  \n",[m
[32m+[m[32m       "3                                            English    10.0  tt3032476  \n",[m
[32m+[m[32m       "4                                             German    10.0  tt5753856  "[m
[32m+[m[32m      ][m
[32m+[m[32m     },[m
[32m+[m[32m     "execution_count": 10,[m
[32m+[m[32m     "metadata": {},[m
[32m+[m[32m     "output_type": "execute_result"[m
[32m+[m[32m    }[m
[32m+[m[32m   ],[m
[32m+[m[32m   "source": [[m
[32m+[m[32m    "df_tv.head()"[m
[32m+[m[32m   ][m
[32m+[m[32m  },[m
[32m+[m[32m  {[m
[32m+[m[32m   "cell_type": "code",[m
[32m+[m[32m   "execution_count": 11,[m
[32m+[m[32m   "id": "59b6db27-dc9d-4e32-a1df-8d653733f7ce",[m
[32m+[m[32m   "metadata": {},[m
[32m+[m[32m   "outputs": [[m
[32m+[m[32m    {[m
[32m+[m[32m     "name": "stdout",[m
[32m+[m[32m     "output_type": "stream",[m
[32m+[m[32m     "text": [[m
[32m+[m[32m      "<class 'pandas.DataFrame'>\n",[m
[32m+[m[32m      "RangeIndex: 5368 entries, 0 to 5367\n",[m
[32m+[m[32m      "Data columns (total 15 columns):\n",[m
[32m+[m[32m      " #   Column           Non-Null Count  Dtype\n",[m
[32m+[m[32m      "---  ------           --------------  -----\n",[m
[32m+[m[32m      " 0   ID               5368 non-null   int64\n",[m
[32m+[m[32m      " 1   Title            5368 non-null   str  \n",[m
[32m+[m[32m      " 2   Year             5368 non-null   int64\n",[m
[32m+[m[32m      " 3   Age              3241 non-null   str  \n",[m
[32m+[m[32m      " 4   Rotten Tomatoes  5368 non-null   str  \n",[m
[32m+[m[32m      " 5   Netflix          5368 non-null   int64\n",[m
[32m+[m[32m      " 6   Hulu             5368 non-null   int64\n",[m
[32m+[m[32m      " 7   Prime Video      5368 non-null   int64\n",[m
[32m+[m[32m      " 8   Disney+          5368 non-null   int64\n",[m
[32m+[m[32m      " 9   Type             5368 non-null   int64\n",[m
[32m+[m[32m      " 10  Genre            2210 non-null   str  \n",[m
[32m+[m[32m      " 11  Country          2697 non-null   str  \n",[m
[32m+[m[32m      " 12  Language         2043 non-null   str  \n",[m
[32m+[m[32m      " 13  IMDb             4498 non-null   str  \n",[m
[32m+[m[32m      " 14  IMDb_ID          2688 non-null   str  \n",[m
[32m+[m[32m      "dtypes: int64(7), str(8)\n",[m
[32m+[m[32m      "memory usage: 629.2 KB\n"[m
[32m+[m[32m     ][m
[32m+[m[32m    }[m
[32m+[m[32m   ],[m
[32m+[m[32m   "source": [[m
[32m+[m[32m    "df_tv.info()"[m
[32m+[m[32m   ][m
[32m+[m[32m  },[m
[32m+[m[32m  {[m
[32m+[m[32m   "cell_type": "code",[m
[32m+[m[32m   "execution_count": 15,[m
[32m+[m[32m   "id": "8e74ba98-3df0-4b35-9c34-a7591d9a6893",[m
[32m+[m[32m   "metadata": {},[m
[32m+[m[32m   "outputs": [[m
[32m+[m[32m    {[m
[32m+[m[32m     "data": {[m
[32m+[m[32m      "text/html": [[m
[32m+[m[32m       "<div>\n",[m
[32m+[m[32m       "<style scoped>\n",[m
[32m+[m[32m       "    .dataframe tbody tr th:only-of-type {\n",[m
[32m+[m[32m       "        vertical-align: middle;\n",[m
[32m+[m[32m       "    }\n",[m
[32m+[m[32m       "\n",[m
[32m+[m[32m       "    .dataframe tbody tr th {\n",[m
[32m+[m[32m       "        vertical-align: top;\n",[m
[32m+[m[32m       "    }\n",[m
[32m+[m[32m       "\n",[m
[32m+[m[32m       "    .dataframe thead th {\n",[m
[32m+[m[32m       "        text-align: right;\n",[m
[32m+[m[32m       "    }\n",[m
[32m+[m[32m       "</style>\n",[m
[32m+[m[32m       "<table border=\"1\" class=\"dataframe\">\n",[m
[32m+[m[32m       "  <thead>\n",[m
[32m+[m[32m       "    <tr style=\"text-align: right;\">\n",[m
[32m+[m[32m       "      <th></th>\n",[m
[32m+[m[32m       "      <th>ID</th>\n",[m
[32m+[m[32m       "      <th>Year</th>\n",[m
[32m+[m[32m       "      <th>Netflix</th>\n",[m
[32m+[m[32m       "      <th>Hulu</th>\n",[m
[32m+[m[32m       "      <th>Prime Video</th>\n",[m
[32m+[m[32m       "      <th>Disney+</th>\n",[m
[32m+[m[32m       "      <th>Type</th>\n",[m
[32m+[m[32m       "    </tr>\n",[m
[32m+[m[32m       "  </thead>\n",[m
[32m+[m[32m       "  <tbody>\n",[m
[32m+[m[32m       "    <tr>\n",[m
[32m+[m[32m       "      <th>count</th>\n",[m
[32m+[m[32m       "      <td>5368.000000</td>\n",[m
[32m+[m[32m       "      <td>5368.000000</td>\n",[m
[32m+[m[32m       "      <td>5368.000000</td>\n",[m
[32m+[m[32m       "      <td>5368.000000</td>\n",[m
[32m+[m[32m       "      <td>5368.000000</td>\n",[m
[32m+[m[32m       "      <td>5368.000000</td>\n",[m
[32m+[m[32m       "      <td>5368.0</td>\n",[m
[32m+[m[32m       "    </tr>\n",[m
[32m+[m[32m       "    <tr>\n",[m
[32m+[m[32m       "      <th>mean</th>\n",[m
[32m+[m[32m       "      <td>2814.945790</td>\n",[m
[32m+[m[32m       "      <td>2012.628726</td>\n",[m
[32m+[m[32m       "      <td>0.367176</td>\n",[m
[32m+[m[32m       "      <td>0.301975</td>\n",[m
[32m+[m[32m       "      <td>0.341095</td>\n",[m
[32m+[m[32m       "      <td>0.065387</td>\n",[m
[32m+[m[32m       "      <td>1.0</td>\n",[m
[32m+[m[32m       "    </tr>\n",[m
[32m+[m[32m       "    <tr>\n",[m
[32m+[m[32m       "      <th>std</th>\n",[m
[32m+[m[32m       "      <td>1672.385727</td>\n",[m
[32m+[m[32m       "      <td>10.142813</td>\n",[m
[32m+[m[32m       "      <td>0.482080</td>\n",[m
[32m+[m[32m       "      <td>0.459157</td>\n",[m
[32m+[m[32m       "      <td>0.474122</td>\n",[m
[32m+[m[32m       "      <td>0.247231</td>\n",[m
[32m+[m[32m       "      <td>0.0</td>\n",[m
[32m+[m[32m       "    </tr>\n",[m
[32m+[m[32m       "    <tr>\n",[m
[32m+[m[32m       "      <th>min</th>\n",[m
[32m+[m[32m       "      <td>1.000000</td>\n",[m
[32m+[m[32m       "      <td>1904.000000</td>\n",[m
[32m+[m[32m       "      <td>0.000000</td>\n",[m
[32m+[m[32m       "      <td>0.000000</td>\n",[m
[32m+[m[32m       "      <td>0.000000</td>\n",[m
[32m+[m[32m       "      <td>0.000000</td>\n",[m
[32m+[m[32m       "      <td>1.0</td>\n",[m
[32m+[m[32m       "    </tr>\n",[m
[32m+[m[32m       "    <tr>\n",[m
[32m+[m[32m       "      <th>25%</th>\n",[m
[32m+[m[32m       "      <td>1345.750000</td>\n",[m
[32m+[m[32m       "      <td>2011.000000</td>\n",[m
[32m+[m[32m       "      <td>0.000000</td>\n",[m
[32m+[m[32m       "      <td>0.000000</td>\n",[m
[32m+[m[32m       "      <td>0.000000</td>\n",[m
[32m+[m[32m       "      <td>0.000000</td>\n",[m
[32m+[m[32m       "      <td>1.0</td>\n",[m
[32m+[m[32m       "    </tr>\n",[m
[32m+[m[32m       "    <tr>\n",[m
[32m+[m[32m       "      <th>50%</th>\n",[m
[32m+[m[32m       "      <td>2788.000000</td>\n",[m
[32m+[m[32m       "      <td>2016.000000</td>\n",[m
[32m+[m[32m       "      <td>0.000000</td>\n",[m
[32m+[m[32m       "      <td>0.000000</td>\n",[m
[32m+[m[32m       "      <td>0.000000</td>\n",[m
[32m+[m[32m       "      <td>0.000000</td>\n",[m
[32m+[m[32m       "      <td>1.0</td>\n",[m
[32m+[m[32m       "    </tr>\n",[m
[32m+[m[32m       "    <tr>\n",[m
[32m+[m[32m       "      <th>75%</th>\n",[m
[32m+[m[32m       "      <td>4308.250000</td>\n",[m
[32m+[m[32m       "      <td>2018.000000</td>\n",[m
[32m+[m[32m       "      <td>1.000000</td>\n",[m
[32m+[m[32m       "      <td>1.000000</td>\n",[m
[32m+[m[32m       "      <td>1.000000</td>\n",[m
[32m+[m[32m       "      <td>0.000000</td>\n",[m
[32m+[m[32m       "      <td>1.0</td>\n",[m
[32m+[m[32m       "    </tr>\n",[m
[32m+[m[32m       "    <tr>\n",[m
[32m+[m[32m       "      <th>max</th>\n",[m
[32m+[m[32m       "      <td>5717.000000</td>\n",[m
[32m+[m[32m       "      <td>2021.000000</td>\n",[m
[32m+[m[32m       "      <td>1.000000</td>\n",[m
[32m+[m[32m       "      <td>1.000000</td>\n",[m
[32m+[m[32m       "      <td>1.000000</td>\n",[m
[32m+[m[32m       "      <td>1.000000</td>\n",[m
[32m+[m[32m       "      <td>1.0</td>\n",[m
[32m+[m[32m       "    </tr>\n",[m
[32m+[m[32m       "  </tbody>\n",[m
[32m+[m[32m       "</table>\n",[m
[32m+[m[32m       "</div>"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "text/plain": [[m
[32m+[m[32m       "                ID         Year      Netflix         Hulu  Prime Video  \\\n",[m
[32m+[m[32m       "count  5368.000000  5368.000000  5368.000000  5368.000000  5368.000000   \n",[m
[32m+[m[32m       "mean   2814.945790  2012.628726     0.367176     0.301975     0.341095   \n",[m
[32m+[m[32m       "std    1672.385727    10.142813     0.482080     0.459157     0.474122   \n",[m
[32m+[m[32m       "min       1.000000  1904.000000     0.000000     0.000000     0.000000   \n",[m
[32m+[m[32m       "25%    1345.750000  2011.000000     0.000000     0.000000     0.000000   \n",[m
[32m+[m[32m       "50%    2788.000000  2016.000000     0.000000     0.000000     0.000000   \n",[m
[32m+[m[32m       "75%    4308.250000  2018.000000     1.000000     1.000000     1.000000   \n",[m
[32m+[m[32m       "max    5717.000000  2021.000000     1.000000     1.000000     1.000000   \n",[m
[32m+[m[32m       "\n",[m
[32m+[m[32m       "           Disney+    Type  \n",[m
[32m+[m[32m       "count  5368.000000  5368.0  \n",[m
[32m+[m[32m       "mean      0.065387     1.0  \n",[m
[32m+[m[32m       "std       0.247231     0.0  \n",[m
[32m+[m[32m       "min       0.000000     1.0  \n",[m
[32m+[m[32m       "25%       0.000000     1.0  \n",[m
[32m+[m[32m       "50%       0.000000     1.0  \n",[m
[32m+[m[32m       "75%       0.000000     1.0  \n",[m
[32m+[m[32m       "max       1.000000     1.0  "[m
[32m+[m[32m      ][m
[32m+[m[32m     },[m
[32m+[m[32m     "execution_count": 15,[m
[32m+[m[32m     "metadata": {},[m
[32m+[m[32m     "output_type": "execute_result"[m
[32m+[m[32m    }[m
[32m+[m[32m   ],[m
[32m+[m[32m   "source": [[m
[32m+[m[32m    "df_tv.describe()"[m
[32m+[m[32m   ][m
[32m+[m[32m  },[m
[32m+[m[32m  {[m
[32m+[m[32m   "cell_type": "code",[m
[32m+[m[32m   "execution_count": 16,[m
[32m+[m[32m   "id": "a8e759d9-f52f-45e8-ad4d-cab8fb0310bb",[m
[32m+[m[32m   "metadata": {},[m
[32m+[m[32m   "outputs": [],[m
[32m+[m[32m   "source": [[m
[32m+[m[32m    "if 'watch_time' in df_movie.columns:\n",[m
[32m+[m[32m    "    df_movie['watch_time'].hist()\n",[m
[32m+[m[32m    "    plt.title('Watch Time Distribution')\n",[m
[32m+[m[32m    "    plt.show()"[m
[32m+[m[32m   ][m
[32m+[m[32m  },[m
   {[m
    "cell_type": "code",[m
    "execution_count": null,[m
[36m@@ -61,7 +1075,25 @@[m
    ][m
   }[m
  ],[m
[31m- "metadata": {},[m
[32m+[m[32m "metadata": {[m
[32m+[m[32m  "kernelspec": {[m
[32m+[m[32m   "display_name": "Python 3 (ipykernel)",[m
[32m+[m[32m   "language": "python",[m
[32m+[m[32m   "name": "python3"[m
[32m+[m[32m  },[m
[32m+[m[32m  "language_info": {[m
[32m+[m[32m   "codemirror_mode": {[m
[32m+[m[32m    "name": "ipython",[m
[32m+[m[32m    "version": 3[m
[32m+[m[32m   },[m
[32m+[m[32m   "file_extension": ".py",[m
[32m+[m[32m   "mimetype": "text/x-python",[m
[32m+[m[32m   "name": "python",[m
[32m+[m[32m   "nbconvert_exporter": "python",[m
[32m+[m[32m   "pygments_lexer": "ipython3",[m
[32m+[m[32m   "version": "3.12.13"[m
[32m+[m[32m  }[m
[32m+[m[32m },[m
  "nbformat": 4,[m
  "nbformat_minor": 5[m
 }[m
[1mdiff --git a/notebooks/02_Data_ETL.ipynb b/notebooks/02_Data_ETL.ipynb[m
[1mnew file mode 100644[m
[1mindex 0000000..4107380[m
[1m--- /dev/null[m
[1m+++ b/notebooks/02_Data_ETL.ipynb[m
[36m@@ -0,0 +1,1289 @@[m
[32m+[m[32m{[m
[32m+[m[32m "cells": [[m
[32m+[m[32m  {[m
[32m+[m[32m   "cell_type": "markdown",[m
[32m+[m[32m   "id": "1a676818-2e5b-41e9-9bb8-e03f71b98ce5",[m
[32m+[m[32m   "metadata": {},[m
[32m+[m[32m   "source": [[m
[32m+[m[32m    "## Load Data"[m
[32m+[m[32m   ][m
[32m+[m[32m  },[m
[32m+[m[32m  {[m
[32m+[m[32m   "cell_type": "code",[m
[32m+[m[32m   "execution_count": 1,[m
[32m+[m[32m   "id": "ed71bc77-d83d-4ae5-933b-02afb6b8f770",[m
[32m+[m[32m   "metadata": {},[m
[32m+[m[32m   "outputs": [],[m
[32m+[m[32m   "source": [[m
[32m+[m[32m    "# import libraries\n",[m
[32m+[m[32m    "import pandas as pd\n",[m
[32m+[m[32m    "import numpy as np\n",[m
[32m+[m[32m    "from pathlib import Path"[m
[32m+[m[32m   ][m
[32m+[m[32m  },[m
[32m+[m[32m  {[m
[32m+[m[32m   "cell_type": "code",[m
[32m+[m[32m   "execution_count": 2,[m
[32m+[m[32m   "id": "8c686ba7-1b7d-421a-a1ed-4b4f8e154d9b",[m
[32m+[m[32m   "metadata": {},[m
[32m+[m[32m   "outputs": [[m
[32m+[m[32m    {[m
[32m+[m[32m     "name": "stdout",[m
[32m+[m[32m     "output_type": "stream",[m
[32m+[m[32m     "text": [[m
[32m+[m[32m      "Loaded: /home/csantosh/Build_Projects/streaming-bi-template/Data/MoviesOnStreamingPlatforms.csv\n",[m
[32m+[m[32m      "Loaded: /home/csantosh/Build_Projects/streaming-bi-template/Data/TVShowsOnStreamingPlatforms.csv\n",[m
[32m+[m[32m      "df_movie shape: (9515, 15)\n",[m
[32m+[m[32m      "df_tv shape: (5368, 15)\n"[m
[32m+[m[32m     ][m
[32m+[m[32m    }[m
[32m+[m[32m   ],[m
[32m+[m[32m   "source": [[m
[32m+[m[32m    "# import data\n",[m
[32m+[m[32m    "DATA_DIR = Path.cwd().parents[0] / \"Data\"  # adjust if needed\n",[m
[32m+[m[32m    "\n",[m
[32m+[m[32m    "def load_csv(filename: str) -> pd.DataFrame:\n",[m
[32m+[m[32m    "    fp = DATA_DIR / filename\n",[m
[32m+[m[32m    "\n",[m
[32m+[m[32m    "    if fp.exists():\n",[m
[32m+[m[32m    "        print(f\"Loaded: {fp}\")\n",[m
[32m+[m[32m    "        return pd.read_csv(fp)\n",[m
[32m+[m[32m    "    raise FileNotFoundError(\n",[m
[32m+[m[32m    "        f\"Could not find {filename} in any of: {[str(d) for d in DATA_DIR]}\"\n",[m
[32m+[m[32m    "    )\n",[m
[32m+[m[32m    "\n",[m
[32m+[m[32m    "df_movie = load_csv(\"MoviesOnStreamingPlatforms.csv\")\n",[m
[32m+[m[32m    "df_tv = load_csv(\"TVShowsOnStreamingPlatforms.csv\")\n",[m
[32m+[m[32m    "print(\"df_movie shape:\", df_movie.shape)\n",[m
[32m+[m[32m    "print(\"df_tv shape:\", df_tv.shape)"[m
[32m+[m[32m   ][m
[32m+[m[32m  },[m
[32m+[m[32m  {[m
[32m+[m[32m   "cell_type": "code",[m
[32m+[m[32m   "execution_count": 3,[m
[32m+[m[32m   "id": "454ba3cd-a212-4a41-8b2c-92980c550f62",[m
[32m+[m[32m   "metadata": {},[m
[32m+[m[32m   "outputs": [[m
[32m+[m[32m    {[m
[32m+[m[32m     "data": {[m
[32m+[m[32m      "text/html": [[m
[32m+[m[32m       "<div>\n",[m
[32m+[m[32m       "<style scoped>\n",[m
[32m+[m[32m       "    .dataframe tbody tr th:only-of-type {\n",[m
[32m+[m[32m       "        vertical-align: middle;\n",[m
[32m+[m[32m       "    }\n",[m
[32m+[m[32m       "\n",[m
[32m+[m[32m       "    .dataframe tbody tr th {\n",[m
[32m+[m[32m       "        vertical-align: top;\n",[m
[32m+[m[32m       "    }\n",[m
[32m+[m[32m       "\n",[m
[32m+[m[32m       "    .dataframe thead th {\n",[m
[32m+[m[32m       "        text-align: right;\n",[m
[32m+[m[32m       "    }\n",[m
[32m+[m[32m       "</style>\n",[m
[32m+[m[32m       "<table border=\"1\" class=\"dataframe\">\n",[m
[32m+[m[32m       "  <thead>\n",[m
[32m+[m[32m       "    <tr style=\"text-align: right;\">\n",[m
[32m+[m[32m       "      <th></th>\n",[m
[32m+[m[32m       "      <th>ID</th>\n",[m
[32m+[m[32m       "      <th>Title</th>\n",[m
[32m+[m[32m       "      <th>Year</th>\n",[m
[32m+[m[32m       "      <th>Age</th>\n",[m
[32m+[m[32m       "      <th>Rotten Tomatoes</th>\n",[m
[32m+[m[32m       "      <th>Netflix</th>\n",[m
[32m+[m[32m       "      <th>Hulu</th>\n",[m
[32m+[m[32m       "      <th>Prime Video</th>\n",[m
[32m+[m[32m       "      <th>Disney+</th>\n",[m
[32m+[m[32m       "      <th>Type</th>\n",[m
[32m+[m[32m       "      <th>Genre</th>\n",[m
[32m+[m[32m       "      <th>Country</th>\n",[m
[32m+[m[32m       "      <th>Language</th>\n",[m
[32m+[m[32m       "      <th>IMDb</th>\n",[m
[32m+[m[32m       "      <th>IMDb_ID</th>\n",[m
[32m+[m[32m       "    </tr>\n",[m
[32m+[m[32m       "  </thead>\n",[m
[32m+[m[32m       "  <tbody>\n",[m
[32m+[m[32m       "    <tr>\n",[m
[32m+[m[32m       "      <th>0</th>\n",[m
[32m+[m[32m       "      <td>1</td>\n",[m
[32m+[m[32m       "      <td>The Irishman</td>\n",[m
[32m+[m[32m       "      <td>2019</td>\n",[m
[32m+[m[32m       "      <td>18+</td>\n",[m
[32m+[m[32m       "      <td>98/100</td>\n",[m
[32m+[m[32m       "      <td>1</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>Biography, Crime, Drama</td>\n",[m
[32m+[m[32m       "      <td>United States</td>\n",[m
[32m+[m[32m       "      <td>English, Italian, Latin, Spanish, German</td>\n",[m
[32m+[m[32m       "      <td>7.8</td>\n",[m
[32m+[m[32m       "      <td>tt1302006</td>\n",[m
[32m+[m[32m       "    </tr>\n",[m
[32m+[m[32m       "    <tr>\n",[m
[32m+[m[32m       "      <th>1</th>\n",[m
[32m+[m[32m       "      <td>2</td>\n",[m
[32m+[m[32m       "      <td>Dangal</td>\n",[m
[32m+[m[32m       "      <td>2016</td>\n",[m
[32m+[m[32m       "      <td>7+</td>\n",[m
[32m+[m[32m       "      <td>97/100</td>\n",[m
[32m+[m[32m       "      <td>1</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>Action, Biography, Drama</td>\n",[m
[32m+[m[32m       "      <td>India, United States</td>\n",[m
[32m+[m[32m       "      <td>Hindi, English</td>\n",[m
[32m+[m[32m       "      <td>8.3</td>\n",[m
[32m+[m[32m       "      <td>tt5074352</td>\n",[m
[32m+[m[32m       "    </tr>\n",[m
[32m+[m[32m       "    <tr>\n",[m
[32m+[m[32m       "      <th>2</th>\n",[m
[32m+[m[32m       "      <td>3</td>\n",[m
[32m+[m[32m       "      <td>David Attenborough: A Life on Our Planet</td>\n",[m
[32m+[m[32m       "      <td>2020</td>\n",[m
[32m+[m[32m       "      <td>7+</td>\n",[m
[32m+[m[32m       "      <td>95/100</td>\n",[m
[32m+[m[32m       "      <td>1</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>Documentary, Biography</td>\n",[m
[32m+[m[32m       "      <td>United Kingdom</td>\n",[m
[32m+[m[32m       "      <td>English</td>\n",[m
[32m+[m[32m       "      <td>8.9</td>\n",[m
[32m+[m[32m       "      <td>tt11989890</td>\n",[m
[32m+[m[32m       "    </tr>\n",[m
[32m+[m[32m       "    <tr>\n",[m
[32m+[m[32m       "      <th>3</th>\n",[m
[32m+[m[32m       "      <td>4</td>\n",[m
[32m+[m[32m       "      <td>Lagaan: Once Upon a Time in India</td>\n",[m
[32m+[m[32m       "      <td>2001</td>\n",[m
[32m+[m[32m       "      <td>7+</td>\n",[m
[32m+[m[32m       "      <td>94/100</td>\n",[m
[32m+[m[32m       "      <td>1</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>Drama, Musical, Sport</td>\n",[m
[32m+[m[32m       "      <td>India, United States</td>\n",[m
[32m+[m[32m       "      <td>Hindi, English</td>\n",[m
[32m+[m[32m       "      <td>8.1</td>\n",[m
[32m+[m[32m       "      <td>tt0169102</td>\n",[m
[32m+[m[32m       "    </tr>\n",[m
[32m+[m[32m       "    <tr>\n",[m
[32m+[m[32m       "      <th>4</th>\n",[m
[32m+[m[32m       "      <td>5</td>\n",[m
[32m+[m[32m       "      <td>Roma</td>\n",[m
[32m+[m[32m       "      <td>2018</td>\n",[m
[32m+[m[32m       "      <td>18+</td>\n",[m
[32m+[m[32m       "      <td>94/100</td>\n",[m
[32m+[m[32m       "      <td>1</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>Drama</td>\n",[m
[32m+[m[32m       "      <td>Mexico, United States</td>\n",[m
[32m+[m[32m       "      <td>Spanish, Mixtec, English, Japanese, German, Fr...</td>\n",[m
[32m+[m[32m       "      <td>7.6</td>\n",[m
[32m+[m[32m       "      <td>tt6155172</td>\n",[m
[32m+[m[32m       "    </tr>\n",[m
[32m+[m[32m       "  </tbody>\n",[m
[32m+[m[32m       "</table>\n",[m
[32m+[m[32m       "</div>"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "text/plain": [[m
[32m+[m[32m       "   ID                                     Title  Year  Age Rotten Tomatoes  \\\n",[m
[32m+[m[32m       "0   1                              The Irishman  2019  18+          98/100   \n",[m
[32m+[m[32m       "1   2                                    Dangal  2016   7+          97/100   \n",[m
[32m+[m[32m       "2   3  David Attenborough: A Life on Our Planet  2020   7+          95/100   \n",[m
[32m+[m[32m       "3   4         Lagaan: Once Upon a Time in India  2001   7+          94/100   \n",[m
[32m+[m[32m       "4   5                                      Roma  2018  18+          94/100   \n",[m
[32m+[m[32m       "\n",[m
[32m+[m[32m       "   Netflix  Hulu  Prime Video  Disney+  Type                     Genre  \\\n",[m
[32m+[m[32m       "0        1     0            0        0     0   Biography, Crime, Drama   \n",[m
[32m+[m[32m       "1        1     0            0        0     0  Action, Biography, Drama   \n",[m
[32m+[m[32m       "2        1     0            0        0     0    Documentary, Biography   \n",[m
[32m+[m[32m       "3        1     0            0        0     0     Drama, Musical, Sport   \n",[m
[32m+[m[32m       "4        1     0            0        0     0                     Drama   \n",[m
[32m+[m[32m       "\n",[m
[32m+[m[32m       "                 Country                                           Language  \\\n",[m
[32m+[m[32m       "0          United States           English, Italian, Latin, Spanish, German   \n",[m
[32m+[m[32m       "1   India, United States                                     Hindi, English   \n",[m
[32m+[m[32m       "2         United Kingdom                                            English   \n",[m
[32m+[m[32m       "3   India, United States                                     Hindi, English   \n",[m
[32m+[m[32m       "4  Mexico, United States  Spanish, Mixtec, English, Japanese, German, Fr...   \n",[m
[32m+[m[32m       "\n",[m
[32m+[m[32m       "   IMDb     IMDb_ID  \n",[m
[32m+[m[32m       "0   7.8   tt1302006  \n",[m
[32m+[m[32m       "1   8.3   tt5074352  \n",[m
[32m+[m[32m       "2   8.9  tt11989890  \n",[m
[32m+[m[32m       "3   8.1   tt0169102  \n",[m
[32m+[m[32m       "4   7.6   tt6155172  "[m
[32m+[m[32m      ][m
[32m+[m[32m     },[m
[32m+[m[32m     "execution_count": 3,[m
[32m+[m[32m     "metadata": {},[m
[32m+[m[32m     "output_type": "execute_result"[m
[32m+[m[32m    }[m
[32m+[m[32m   ],[m
[32m+[m[32m   "source": [[m
[32m+[m[32m    "df_movie.head()"[m
[32m+[m[32m   ][m
[32m+[m[32m  },[m
[32m+[m[32m  {[m
[32m+[m[32m   "cell_type": "code",[m
[32m+[m[32m   "execution_count": 4,[m
[32m+[m[32m   "id": "d30c53cc-64b1-49aa-b8c8-318dc749fcec",[m
[32m+[m[32m   "metadata": {},[m
[32m+[m[32m   "outputs": [[m
[32m+[m[32m    {[m
[32m+[m[32m     "name": "stdout",[m
[32m+[m[32m     "output_type": "stream",[m
[32m+[m[32m     "text": [[m
[32m+[m[32m      "<class 'pandas.DataFrame'>\n",[m
[32m+[m[32m      "RangeIndex: 9515 entries, 0 to 9514\n",[m
[32m+[m[32m      "Data columns (total 15 columns):\n",[m
[32m+[m[32m      " #   Column           Non-Null Count  Dtype  \n",[m
[32m+[m[32m      "---  ------           --------------  -----  \n",[m
[32m+[m[32m      " 0   ID               9515 non-null   int64  \n",[m
[32m+[m[32m      " 1   Title            9515 non-null   str    \n",[m
[32m+[m[32m      " 2   Year             9515 non-null   int64  \n",[m
[32m+[m[32m      " 3   Age              5338 non-null   str    \n",[m
[32m+[m[32m      " 4   Rotten Tomatoes  9508 non-null   str    \n",[m
[32m+[m[32m      " 5   Netflix          9515 non-null   int64  \n",[m
[32m+[m[32m      " 6   Hulu             9515 non-null   int64  \n",[m
[32m+[m[32m      " 7   Prime Video      9515 non-null   int64  \n",[m
[32m+[m[32m      " 8   Disney+          9515 non-null   int64  \n",[m
[32m+[m[32m      " 9   Type             9515 non-null   int64  \n",[m
[32m+[m[32m      " 10  Genre            6030 non-null   str    \n",[m
[32m+[m[32m      " 11  Country          6387 non-null   str    \n",[m
[32m+[m[32m      " 12  Language         6026 non-null   str    \n",[m
[32m+[m[32m      " 13  IMDb             6732 non-null   float64\n",[m
[32m+[m[32m      " 14  IMDb_ID          6787 non-null   str    \n",[m
[32m+[m[32m      "dtypes: float64(1), int64(7), str(7)\n",[m
[32m+[m[32m      "memory usage: 1.1 MB\n"[m
[32m+[m[32m     ][m
[32m+[m[32m    }[m
[32m+[m[32m   ],[m
[32m+[m[32m   "source": [[m
[32m+[m[32m    "df_movie.info()"[m
[32m+[m[32m   ][m
[32m+[m[32m  },[m
[32m+[m[32m  {[m
[32m+[m[32m   "cell_type": "code",[m
[32m+[m[32m   "execution_count": 5,[m
[32m+[m[32m   "id": "d6b35013-78dd-4d53-9c9e-e559fe892e1b",[m
[32m+[m[32m   "metadata": {},[m
[32m+[m[32m   "outputs": [[m
[32m+[m[32m    {[m
[32m+[m[32m     "name": "stdout",[m
[32m+[m[32m     "output_type": "stream",[m
[32m+[m[32m     "text": [[m
[32m+[m[32m      "<class 'pandas.DataFrame'>\n",[m
[32m+[m[32m      "RangeIndex: 5368 entries, 0 to 5367\n",[m
[32m+[m[32m      "Data columns (total 15 columns):\n",[m
[32m+[m[32m      " #   Column           Non-Null Count  Dtype\n",[m
[32m+[m[32m      "---  ------           --------------  -----\n",[m
[32m+[m[32m      " 0   ID               5368 non-null   int64\n",[m
[32m+[m[32m      " 1   Title            5368 non-null   str  \n",[m
[32m+[m[32m      " 2   Year             5368 non-null   int64\n",[m
[32m+[m[32m      " 3   Age              3241 non-null   str  \n",[m
[32m+[m[32m      " 4   Rotten Tomatoes  5368 non-null   str  \n",[m
[32m+[m[32m      " 5   Netflix          5368 non-null   int64\n",[m
[32m+[m[32m      " 6   Hulu             5368 non-null   int64\n",[m
[32m+[m[32m      " 7   Prime Video      5368 non-null   int64\n",[m
[32m+[m[32m      " 8   Disney+          5368 non-null   int64\n",[m
[32m+[m[32m      " 9   Type             5368 non-null   int64\n",[m
[32m+[m[32m      " 10  Genre            2210 non-null   str  \n",[m
[32m+[m[32m      " 11  Country          2697 non-null   str  \n",[m
[32m+[m[32m      " 12  Language         2043 non-null   str  \n",[m
[32m+[m[32m      " 13  IMDb             4498 non-null   str  \n",[m
[32m+[m[32m      " 14  IMDb_ID          2688 non-null   str  \n",[m
[32m+[m[32m      "dtypes: int64(7), str(8)\n",[m
[32m+[m[32m      "memory usage: 629.2 KB\n"[m
[32m+[m[32m     ][m
[32m+[m[32m    }[m
[32m+[m[32m   ],[m
[32m+[m[32m   "source": [[m
[32m+[m[32m    "df_tv.info()"[m
[32m+[m[32m   ][m
[32m+[m[32m  },[m
[32m+[m[32m  {[m
[32m+[m[32m   "cell_type": "markdown",[m
[32m+[m[32m   "id": "069a2009-c1fc-4a22-8ccb-80a8ae4d16f5",[m
[32m+[m[32m   "metadata": {},[m
[32m+[m[32m   "source": [[m
[32m+[m[32m    "## Parsing and Conversion"[m
[32m+[m[32m   ][m
[32m+[m[32m  },[m
[32m+[m[32m  {[m
[32m+[m[32m   "cell_type": "code",[m
[32m+[m[32m   "execution_count": 6,[m
[32m+[m[32m   "id": "6db9a1dc-9b12-4992-a2e0-9e7e4e084aed",[m
[32m+[m[32m   "metadata": {},[m
[32m+[m[32m   "outputs": [],[m
[32m+[m[32m   "source": [[m
[32m+[m[32m    "# Common parsing / conversion helpers\n",[m
[32m+[m[32m    "\n",[m
[32m+[m[32m    "def standardize_title(df: pd.DataFrame, col: str = \"Title\") -> pd.DataFrame:\n",[m
[32m+[m[32m    "    if col in df.columns:\n",[m
[32m+[m[32m    "        df[col] = df[col].astype(str).str.strip() # Removes leading and trailing whitespace\n",[m
[32m+[m[32m    "    return df \n",[m
[32m+[m[32m    "\n",[m
[32m+[m[32m    "def add_age_min(df: pd.DataFrame, source_col: str = \"Age\") -> pd.DataFrame:\n",[m
[32m+[m[32m    "    \"\"\"Convert '18+' -> 18, '7+' -> 7 (numeric). Leaves NaN if missing/unparseable.\"\"\"\n",[m
[32m+[m[32m    "    if source_col in df.columns:\n",[m
[32m+[m[32m    "        df[\"Age_Min\"] = pd.to_numeric(\n",[m
[32m+[m[32m    "            df[source_col].astype(str).str.extract(r\"(\\d+)\")[0],\n",[m
[32m+[m[32m    "            errors=\"coerce\"\n",[m
[32m+[m[32m    "        )\n",[m
[32m+[m[32m    "    return df\n",[m
[32m+[m[32m    "\n",[m
[32m+[m[32m    "def add_rotten_tomatoes_score(df: pd.DataFrame, source_col: str = \"Rotten Tomatoes\") -> pd.DataFrame:\n",[m
[32m+[m[32m    "    \"\"\"Convert '98/100' -> 98.0 (numeric). Leaves NaN if missing/unparseable.\"\"\"\n",[m
[32m+[m[32m    "    if source_col in df.columns:\n",[m
[32m+[m[32m    "        df[\"RottenTomatoes_Score\"] = pd.to_numeric(\n",[m
[32m+[m[32m    "            df[source_col].astype(str).str.extract(r\"(\\d+)\")[0], \n",[m
[32m+[m[32m    "            errors=\"coerce\"\n",[m
[32m+[m[32m    "        )\n",[m
[32m+[m[32m    "        \n",[m
[32m+[m[32m    "    return df\n",[m
[32m+[m[32m    "\n",[m
[32m+[m[32m    "def standardize_type(df: pd.DataFrame, col: str = \"Type\") -> pd.DataFrame:\n",[m
[32m+[m[32m    "    \"\"\"The datasets encode Type as 0/1. We'll map to readable labels.\"\"\"\n",[m
[32m+[m[32m    "    if col in df.columns:\n",[m
[32m+[m[32m    "        # Keep original for reference\n",[m
[32m+[m[32m    "        df[col] = df[col].map({0: \"movie\", 1: \"tv_show\"}).fillna(df[col].astype(str))\n",[m
[32m+[m[32m    "    return df\n"[m
[32m+[m[32m   ][m
[32m+[m[32m  },[m
[32m+[m[32m  {[m
[32m+[m[32m   "cell_type": "code",[m
[32m+[m[32m   "execution_count": 7,[m
[32m+[m[32m   "id": "c03bcc79-2cef-4313-8a67-7000c99ff610",[m
[32m+[m[32m   "metadata": {},[m
[32m+[m[32m   "outputs": [[m
[32m+[m[32m    {[m
[32m+[m[32m     "data": {[m
[32m+[m[32m      "text/html": [[m
[32m+[m[32m       "<div>\n",[m
[32m+[m[32m       "<style scoped>\n",[m
[32m+[m[32m       "    .dataframe tbody tr th:only-of-type {\n",[m
[32m+[m[32m       "        vertical-align: middle;\n",[m
[32m+[m[32m       "    }\n",[m
[32m+[m[32m       "\n",[m
[32m+[m[32m       "    .dataframe tbody tr th {\n",[m
[32m+[m[32m       "        vertical-align: top;\n",[m
[32m+[m[32m       "    }\n",[m
[32m+[m[32m       "\n",[m
[32m+[m[32m       "    .dataframe thead th {\n",[m
[32m+[m[32m       "        text-align: right;\n",[m
[32m+[m[32m       "    }\n",[m
[32m+[m[32m       "</style>\n",[m
[32m+[m[32m       "<table border=\"1\" class=\"dataframe\">\n",[m
[32m+[m[32m       "  <thead>\n",[m
[32m+[m[32m       "    <tr style=\"text-align: right;\">\n",[m
[32m+[m[32m       "      <th></th>\n",[m
[32m+[m[32m       "      <th>ID</th>\n",[m
[32m+[m[32m       "      <th>Title</th>\n",[m
[32m+[m[32m       "      <th>Year</th>\n",[m
[32m+[m[32m       "      <th>Netflix</th>\n",[m
[32m+[m[32m       "      <th>Hulu</th>\n",[m
[32m+[m[32m       "      <th>Prime Video</th>\n",[m
[32m+[m[32m       "      <th>Disney+</th>\n",[m
[32m+[m[32m       "      <th>Type</th>\n",[m
[32m+[m[32m       "      <th>Genre</th>\n",[m
[32m+[m[32m       "      <th>Country</th>\n",[m
[32m+[m[32m       "      <th>Language</th>\n",[m
[32m+[m[32m       "      <th>IMDb</th>\n",[m
[32m+[m[32m       "      <th>IMDb_ID</th>\n",[m
[32m+[m[32m       "      <th>Age_Min</th>\n",[m
[32m+[m[32m       "      <th>RottenTomatoes_Score</th>\n",[m
[32m+[m[32m       "    </tr>\n",[m
[32m+[m[32m       "  </thead>\n",[m
[32m+[m[32m       "  <tbody>\n",[m
[32m+[m[32m       "    <tr>\n",[m
[32m+[m[32m       "      <th>0</th>\n",[m
[32m+[m[32m       "      <td>1</td>\n",[m
[32m+[m[32m       "      <td>The Irishman</td>\n",[m
[32m+[m[32m       "      <td>2019</td>\n",[m
[32m+[m[32m       "      <td>1</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>movie</td>\n",[m
[32m+[m[32m       "      <td>Biography, Crime, Drama</td>\n",[m
[32m+[m[32m       "      <td>United States</td>\n",[m
[32m+[m[32m       "      <td>English, Italian, Latin, Spanish, German</td>\n",[m
[32m+[m[32m       "      <td>7.8</td>\n",[m
[32m+[m[32m       "      <td>tt1302006</td>\n",[m
[32m+[m[32m       "      <td>18.0</td>\n",[m
[32m+[m[32m       "      <td>98.0</td>\n",[m
[32m+[m[32m       "    </tr>\n",[m
[32m+[m[32m       "    <tr>\n",[m
[32m+[m[32m       "      <th>1</th>\n",[m
[32m+[m[32m       "      <td>2</td>\n",[m
[32m+[m[32m       "      <td>Dangal</td>\n",[m
[32m+[m[32m       "      <td>2016</td>\n",[m
[32m+[m[32m       "      <td>1</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>movie</td>\n",[m
[32m+[m[32m       "      <td>Action, Biography, Drama</td>\n",[m
[32m+[m[32m       "      <td>India, United States</td>\n",[m
[32m+[m[32m       "      <td>Hindi, English</td>\n",[m
[32m+[m[32m       "      <td>8.3</td>\n",[m
[32m+[m[32m       "      <td>tt5074352</td>\n",[m
[32m+[m[32m       "      <td>7.0</td>\n",[m
[32m+[m[32m       "      <td>97.0</td>\n",[m
[32m+[m[32m       "    </tr>\n",[m
[32m+[m[32m       "    <tr>\n",[m
[32m+[m[32m       "      <th>2</th>\n",[m
[32m+[m[32m       "      <td>3</td>\n",[m
[32m+[m[32m       "      <td>David Attenborough: A Life on Our Planet</td>\n",[m
[32m+[m[32m       "      <td>2020</td>\n",[m
[32m+[m[32m       "      <td>1</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>movie</td>\n",[m
[32m+[m[32m       "      <td>Documentary, Biography</td>\n",[m
[32m+[m[32m       "      <td>United Kingdom</td>\n",[m
[32m+[m[32m       "      <td>English</td>\n",[m
[32m+[m[32m       "      <td>8.9</td>\n",[m
[32m+[m[32m       "      <td>tt11989890</td>\n",[m
[32m+[m[32m       "      <td>7.0</td>\n",[m
[32m+[m[32m       "      <td>95.0</td>\n",[m
[32m+[m[32m       "    </tr>\n",[m
[32m+[m[32m       "    <tr>\n",[m
[32m+[m[32m       "      <th>3</th>\n",[m
[32m+[m[32m       "      <td>4</td>\n",[m
[32m+[m[32m       "      <td>Lagaan: Once Upon a Time in India</td>\n",[m
[32m+[m[32m       "      <td>2001</td>\n",[m
[32m+[m[32m       "      <td>1</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>movie</td>\n",[m
[32m+[m[32m       "      <td>Drama, Musical, Sport</td>\n",[m
[32m+[m[32m       "      <td>India, United States</td>\n",[m
[32m+[m[32m       "      <td>Hindi, English</td>\n",[m
[32m+[m[32m       "      <td>8.1</td>\n",[m
[32m+[m[32m       "      <td>tt0169102</td>\n",[m
[32m+[m[32m       "      <td>7.0</td>\n",[m
[32m+[m[32m       "      <td>94.0</td>\n",[m
[32m+[m[32m       "    </tr>\n",[m
[32m+[m[32m       "    <tr>\n",[m
[32m+[m[32m       "      <th>4</th>\n",[m
[32m+[m[32m       "      <td>5</td>\n",[m
[32m+[m[32m       "      <td>Roma</td>\n",[m
[32m+[m[32m       "      <td>2018</td>\n",[m
[32m+[m[32m       "      <td>1</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>movie</td>\n",[m
[32m+[m[32m       "      <td>Drama</td>\n",[m
[32m+[m[32m       "      <td>Mexico, United States</td>\n",[m
[32m+[m[32m       "      <td>Spanish, Mixtec, English, Japanese, German, Fr...</td>\n",[m
[32m+[m[32m       "      <td>7.6</td>\n",[m
[32m+[m[32m       "      <td>tt6155172</td>\n",[m
[32m+[m[32m       "      <td>18.0</td>\n",[m
[32m+[m[32m       "      <td>94.0</td>\n",[m
[32m+[m[32m       "    </tr>\n",[m
[32m+[m[32m       "  </tbody>\n",[m
[32m+[m[32m       "</table>\n",[m
[32m+[m[32m       "</div>"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "text/plain": [[m
[32m+[m[32m       "   ID                                     Title  Year  Netflix  Hulu  \\\n",[m
[32m+[m[32m       "0   1                              The Irishman  2019        1     0   \n",[m
[32m+[m[32m       "1   2                                    Dangal  2016        1     0   \n",[m
[32m+[m[32m       "2   3  David Attenborough: A Life on Our Planet  2020        1     0   \n",[m
[32m+[m[32m       "3   4         Lagaan: Once Upon a Time in India  2001        1     0   \n",[m
[32m+[m[32m       "4   5                                      Roma  2018        1     0   \n",[m
[32m+[m[32m       "\n",[m
[32m+[m[32m       "   Prime Video  Disney+   Type                     Genre  \\\n",[m
[32m+[m[32m       "0            0        0  movie   Biography, Crime, Drama   \n",[m
[32m+[m[32m       "1            0        0  movie  Action, Biography, Drama   \n",[m
[32m+[m[32m       "2            0        0  movie    Documentary, Biography   \n",[m
[32m+[m[32m       "3            0        0  movie     Drama, Musical, Sport   \n",[m
[32m+[m[32m       "4            0        0  movie                     Drama   \n",[m
[32m+[m[32m       "\n",[m
[32m+[m[32m       "                 Country                                           Language  \\\n",[m
[32m+[m[32m       "0          United States           English, Italian, Latin, Spanish, German   \n",[m
[32m+[m[32m       "1   India, United States                                     Hindi, English   \n",[m
[32m+[m[32m       "2         United Kingdom                                            English   \n",[m
[32m+[m[32m       "3   India, United States                                     Hindi, English   \n",[m
[32m+[m[32m       "4  Mexico, United States  Spanish, Mixtec, English, Japanese, German, Fr...   \n",[m
[32m+[m[32m       "\n",[m
[32m+[m[32m       "   IMDb     IMDb_ID  Age_Min  RottenTomatoes_Score  \n",[m
[32m+[m[32m       "0   7.8   tt1302006     18.0                  98.0  \n",[m
[32m+[m[32m       "1   8.3   tt5074352      7.0                  97.0  \n",[m
[32m+[m[32m       "2   8.9  tt11989890      7.0                  95.0  \n",[m
[32m+[m[32m       "3   8.1   tt0169102      7.0                  94.0  \n",[m
[32m+[m[32m       "4   7.6   tt6155172     18.0                  94.0  "[m
[32m+[m[32m      ][m
[32m+[m[32m     },[m
[32m+[m[32m     "execution_count": 7,[m
[32m+[m[32m     "metadata": {},[m
[32m+[m[32m     "output_type": "execute_result"[m
[32m+[m[32m    }[m
[32m+[m[32m   ],[m
[32m+[m[32m   "source": [[m
[32m+[m[32m    "# Apply conversions to BOTH datasets\n",[m
[32m+[m[32m    "for _df in (df_movie, df_tv):\n",[m
[32m+[m[32m    "    standardize_title(_df)\n",[m
[32m+[m[32m    "    add_age_min(_df)\n",[m
[32m+[m[32m    "    add_rotten_tomatoes_score(_df)\n",[m
[32m+[m[32m    "    standardize_type(_df)\n",[m
[32m+[m[32m    "    _df.drop(columns=['Age', 'Rotten Tomatoes'], inplace=True)\n",[m
[32m+[m[32m    "    \n",[m
[32m+[m[32m    "df_movie.head()"[m
[32m+[m[32m   ][m
[32m+[m[32m  },[m
[32m+[m[32m  {[m
[32m+[m[32m   "cell_type": "code",[m
[32m+[m[32m   "execution_count": 8,[m
[32m+[m[32m   "id": "a0033677-a887-4850-a469-c9391f37699e",[m
[32m+[m[32m   "metadata": {},[m
[32m+[m[32m   "outputs": [],[m
[32m+[m[32m   "source": [[m
[32m+[m[32m    "# tv shows data has IMDb in strings and needs to be converted to float\n",[m
[32m+[m[32m    "def imdb_score_to_float(df: pd.DataFrame, source_col: str = \"IMDb\") -> pd.DataFrame:\n",[m
[32m+[m[32m    "    \"\"\"Convert '98/100' -> 98.0 (numeric). Leaves NaN if missing/unparseable.\"\"\"\n",[m
[32m+[m[32m    "    if source_col in df.columns:\n",[m
[32m+[m[32m    "        df[\"IMDb_Score\"] = pd.to_numeric(\n",[m
[32m+[m[32m    "            df[source_col].astype(str).str.extract(r\"(\\d+)\")[0], \n",[m
[32m+[m[32m    "            errors=\"coerce\"\n",[m
[32m+[m[32m    "        )\n",[m
[32m+[m[32m    "    df.drop(columns=['IMDb'], inplace=True)\n",[m
[32m+[m[32m    "    df.rename(columns={'IMDb_Score':'IMDb'}, inplace=True)\n",[m
[32m+[m[32m    "        \n",[m
[32m+[m[32m    "    return df"[m
[32m+[m[32m   ][m
[32m+[m[32m  },[m
[32m+[m[32m  {[m
[32m+[m[32m   "cell_type": "code",[m
[32m+[m[32m   "execution_count": 9,[m
[32m+[m[32m   "id": "889458e7-ed56-430a-b2ec-6e2c471a2baf",[m
[32m+[m[32m   "metadata": {},[m
[32m+[m[32m   "outputs": [],[m
[32m+[m[32m   "source": [[m
[32m+[m[32m    "df_tv = imdb_score_to_float(df_tv)"[m
[32m+[m[32m   ][m
[32m+[m[32m  },[m
[32m+[m[32m  {[m
[32m+[m[32m   "cell_type": "code",[m
[32m+[m[32m   "execution_count": 10,[m
[32m+[m[32m   "id": "4e759188-07c3-4a26-8625-e8016f2462a2",[m
[32m+[m[32m   "metadata": {},[m
[32m+[m[32m   "outputs": [[m
[32m+[m[32m    {[m
[32m+[m[32m     "data": {[m
[32m+[m[32m      "text/html": [[m
[32m+[m[32m       "<div>\n",[m
[32m+[m[32m       "<style scoped>\n",[m
[32m+[m[32m       "    .dataframe tbody tr th:only-of-type {\n",[m
[32m+[m[32m       "        vertical-align: middle;\n",[m
[32m+[m[32m       "    }\n",[m
[32m+[m[32m       "\n",[m
[32m+[m[32m       "    .dataframe tbody tr th {\n",[m
[32m+[m[32m       "        vertical-align: top;\n",[m
[32m+[m[32m       "    }\n",[m
[32m+[m[32m       "\n",[m
[32m+[m[32m       "    .dataframe thead th {\n",[m
[32m+[m[32m       "        text-align: right;\n",[m
[32m+[m[32m       "    }\n",[m
[32m+[m[32m       "</style>\n",[m
[32m+[m[32m       "<table border=\"1\" class=\"dataframe\">\n",[m
[32m+[m[32m       "  <thead>\n",[m
[32m+[m[32m       "    <tr style=\"text-align: right;\">\n",[m
[32m+[m[32m       "      <th></th>\n",[m
[32m+[m[32m       "      <th>ID</th>\n",[m
[32m+[m[32m       "      <th>Title</th>\n",[m
[32m+[m[32m       "      <th>Year</th>\n",[m
[32m+[m[32m       "      <th>Netflix</th>\n",[m
[32m+[m[32m       "      <th>Hulu</th>\n",[m
[32m+[m[32m       "      <th>Prime Video</th>\n",[m
[32m+[m[32m       "      <th>Disney+</th>\n",[m
[32m+[m[32m       "      <th>Type</th>\n",[m
[32m+[m[32m       "      <th>Genre</th>\n",[m
[32m+[m[32m       "      <th>Country</th>\n",[m
[32m+[m[32m       "      <th>Language</th>\n",[m
[32m+[m[32m       "      <th>IMDb_ID</th>\n",[m
[32m+[m[32m       "      <th>Age_Min</th>\n",[m
[32m+[m[32m       "      <th>RottenTomatoes_Score</th>\n",[m
[32m+[m[32m       "      <th>IMDb</th>\n",[m
[32m+[m[32m       "    </tr>\n",[m
[32m+[m[32m       "  </thead>\n",[m
[32m+[m[32m       "  <tbody>\n",[m
[32m+[m[32m       "    <tr>\n",[m
[32m+[m[32m       "      <th>0</th>\n",[m
[32m+[m[32m       "      <td>1</td>\n",[m
[32m+[m[32m       "      <td>Breaking Bad</td>\n",[m
[32m+[m[32m       "      <td>2008</td>\n",[m
[32m+[m[32m       "      <td>1</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>tv_show</td>\n",[m
[32m+[m[32m       "      <td>crime television series, drama television seri...</td>\n",[m
[32m+[m[32m       "      <td>United States</td>\n",[m
[32m+[m[32m       "      <td>American English, Spanish language in the Amer...</td>\n",[m
[32m+[m[32m       "      <td>tt0903747</td>\n",[m
[32m+[m[32m       "      <td>18.0</td>\n",[m
[32m+[m[32m       "      <td>100</td>\n",[m
[32m+[m[32m       "      <td>10.0</td>\n",[m
[32m+[m[32m       "    </tr>\n",[m
[32m+[m[32m       "    <tr>\n",[m
[32m+[m[32m       "      <th>1</th>\n",[m
[32m+[m[32m       "      <td>2</td>\n",[m
[32m+[m[32m       "      <td>Stranger Things</td>\n",[m
[32m+[m[32m       "      <td>2016</td>\n",[m
[32m+[m[32m       "      <td>1</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>tv_show</td>\n",[m
[32m+[m[32m       "      <td>science fiction television program, horror tel...</td>\n",[m
[32m+[m[32m       "      <td>United States</td>\n",[m
[32m+[m[32m       "      <td>English</td>\n",[m
[32m+[m[32m       "      <td>tt4574334</td>\n",[m
[32m+[m[32m       "      <td>16.0</td>\n",[m
[32m+[m[32m       "      <td>96</td>\n",[m
[32m+[m[32m       "      <td>9.0</td>\n",[m
[32m+[m[32m       "    </tr>\n",[m
[32m+[m[32m       "    <tr>\n",[m
[32m+[m[32m       "      <th>2</th>\n",[m
[32m+[m[32m       "      <td>3</td>\n",[m
[32m+[m[32m       "      <td>Attack on Titan</td>\n",[m
[32m+[m[32m       "      <td>2013</td>\n",[m
[32m+[m[32m       "      <td>1</td>\n",[m
[32m+[m[32m       "      <td>1</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>tv_show</td>\n",[m
[32m+[m[32m       "      <td>NaN</td>\n",[m
[32m+[m[32m       "      <td>NaN</td>\n",[m
[32m+[m[32m       "      <td>NaN</td>\n",[m
[32m+[m[32m       "      <td>NaN</td>\n",[m
[32m+[m[32m       "      <td>18.0</td>\n",[m
[32m+[m[32m       "      <td>95</td>\n",[m
[32m+[m[32m       "      <td>9.0</td>\n",[m
[32m+[m[32m       "    </tr>\n",[m
[32m+[m[32m       "    <tr>\n",[m
[32m+[m[32m       "      <th>3</th>\n",[m
[32m+[m[32m       "      <td>4</td>\n",[m
[32m+[m[32m       "      <td>Better Call Saul</td>\n",[m
[32m+[m[32m       "      <td>2015</td>\n",[m
[32m+[m[32m       "      <td>1</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>tv_show</td>\n",[m
[32m+[m[32m       "      <td>legal drama, crime television series</td>\n",[m
[32m+[m[32m       "      <td>United States</td>\n",[m
[32m+[m[32m       "      <td>English</td>\n",[m
[32m+[m[32m       "      <td>tt3032476</td>\n",[m
[32m+[m[32m       "      <td>18.0</td>\n",[m
[32m+[m[32m       "      <td>94</td>\n",[m
[32m+[m[32m       "      <td>10.0</td>\n",[m
[32m+[m[32m       "    </tr>\n",[m
[32m+[m[32m       "    <tr>\n",[m
[32m+[m[32m       "      <th>4</th>\n",[m
[32m+[m[32m       "      <td>5</td>\n",[m
[32m+[m[32m       "      <td>Dark</td>\n",[m
[32m+[m[32m       "      <td>2017</td>\n",[m
[32m+[m[32m       "      <td>1</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>tv_show</td>\n",[m
[32m+[m[32m       "      <td>science fiction television program, drama tele...</td>\n",[m
[32m+[m[32m       "      <td>Germany</td>\n",[m
[32m+[m[32m       "      <td>German</td>\n",[m
[32m+[m[32m       "      <td>tt5753856</td>\n",[m
[32m+[m[32m       "      <td>16.0</td>\n",[m
[32m+[m[32m       "      <td>93</td>\n",[m
[32m+[m[32m       "      <td>10.0</td>\n",[m
[32m+[m[32m       "    </tr>\n",[m
[32m+[m[32m       "  </tbody>\n",[m
[32m+[m[32m       "</table>\n",[m
[32m+[m[32m       "</div>"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "text/plain": [[m
[32m+[m[32m       "   ID             Title  Year  Netflix  Hulu  Prime Video  Disney+     Type  \\\n",[m
[32m+[m[32m       "0   1      Breaking Bad  2008        1     0            0        0  tv_show   \n",[m
[32m+[m[32m       "1   2   Stranger Things  2016        1     0            0        0  tv_show   \n",[m
[32m+[m[32m       "2   3   Attack on Titan  2013        1     1            0        0  tv_show   \n",[m
[32m+[m[32m       "3   4  Better Call Saul  2015        1     0            0        0  tv_show   \n",[m
[32m+[m[32m       "4   5              Dark  2017        1     0            0        0  tv_show   \n",[m
[32m+[m[32m       "\n",[m
[32m+[m[32m       "                                               Genre        Country  \\\n",[m
[32m+[m[32m       "0  crime television series, drama television seri...  United States   \n",[m
[32m+[m[32m       "1  science fiction television program, horror tel...  United States   \n",[m
[32m+[m[32m       "2                                                NaN            NaN   \n",[m
[32m+[m[32m       "3               legal drama, crime television series  United States   \n",[m
[32m+[m[32m       "4  science fiction television program, drama tele...        Germany   \n",[m
[32m+[m[32m       "\n",[m
[32m+[m[32m       "                                            Language    IMDb_ID  Age_Min  \\\n",[m
[32m+[m[32m       "0  American English, Spanish language in the Amer...  tt0903747     18.0   \n",[m
[32m+[m[32m       "1                                            English  tt4574334     16.0   \n",[m
[32m+[m[32m       "2                                                NaN        NaN     18.0   \n",[m
[32m+[m[32m       "3                                            English  tt3032476     18.0   \n",[m
[32m+[m[32m       "4                                             German  tt5753856     16.0   \n",[m
[32m+[m[32m       "\n",[m
[32m+[m[32m       "   RottenTomatoes_Score  IMDb  \n",[m
[32m+[m[32m       "0                   100  10.0  \n",[m
[32m+[m[32m       "1                    96   9.0  \n",[m
[32m+[m[32m       "2                    95   9.0  \n",[m
[32m+[m[32m       "3                    94  10.0  \n",[m
[32m+[m[32m       "4                    93  10.0  "[m
[32m+[m[32m      ][m
[32m+[m[32m     },[m
[32m+[m[32m     "execution_count": 10,[m
[32m+[m[32m     "metadata": {},[m
[32m+[m[32m     "output_type": "execute_result"[m
[32m+[m[32m    }[m
[32m+[m[32m   ],[m
[32m+[m[32m   "source": [[m
[32m+[m[32m    "df_tv.head()"[m
[32m+[m[32m   ][m
[32m+[m[32m  },[m
[32m+[m[32m  {[m
[32m+[m[32m   "cell_type": "markdown",[m
[32m+[m[32m   "id": "bb8db63f-8b58-4d73-8fba-b424d18c1707",[m
[32m+[m[32m   "metadata": {},[m
[32m+[m[32m   "source": [[m
[32m+[m[32m    "## Removing duplicates based on the titles"[m
[32m+[m[32m   ][m
[32m+[m[32m  },[m
[32m+[m[32m  {[m
[32m+[m[32m   "cell_type": "code",[m
[32m+[m[32m   "execution_count": 11,[m
[32m+[m[32m   "id": "8b324dc2-f70a-4b0a-916b-fcd4cf32d000",[m
[32m+[m[32m   "metadata": {},[m
[32m+[m[32m   "outputs": [[m
[32m+[m[32m    {[m
[32m+[m[32m     "name": "stdout",[m
[32m+[m[32m     "output_type": "stream",[m
[32m+[m[32m     "text": [[m
[32m+[m[32m      "Removed 0 duplicates using subset=['Title']\n",[m
[32m+[m[32m      "Removed 0 duplicates using subset=['Title']\n"[m
[32m+[m[32m     ][m
[32m+[m[32m    }[m
[32m+[m[32m   ],[m
[32m+[m[32m   "source": [[m
[32m+[m[32m    "# Here we use Title to remove duplicate entries with the same title\n",[m
[32m+[m[32m    "def dedupe(df: pd.DataFrame, subset_cols):\n",[m
[32m+[m[32m    "    before = len(df)\n",[m
[32m+[m[32m    "    df2 = df.drop_duplicates(subset=[c for c in subset_cols if c in df.columns], keep=\"first\")\n",[m
[32m+[m[32m    "    after = len(df2)\n",[m
[32m+[m[32m    "    print(f\"Removed {before - after} duplicates using subset={subset_cols}\")\n",[m
[32m+[m[32m    "    return df2\n",[m
[32m+[m[32m    "\n",[m
[32m+[m[32m    "df_movie = dedupe(df_movie, [\"Title\"])\n",[m
[32m+[m[32m    "df_tv = dedupe(df_tv, [\"Title\"])"[m
[32m+[m[32m   ][m
[32m+[m[32m  },[m
[32m+[m[32m  {[m
[32m+[m[32m   "cell_type": "markdown",[m
[32m+[m[32m   "id": "2365f121-54a7-4292-b500-51f8c7b2efd5",[m
[32m+[m[32m   "metadata": {},[m
[32m+[m[32m   "source": [[m
[32m+[m[32m    "## Handling Missing Data"[m
[32m+[m[32m   ][m
[32m+[m[32m  },[m
[32m+[m[32m  {[m
[32m+[m[32m   "cell_type": "code",[m
[32m+[m[32m   "execution_count": 12,[m
[32m+[m[32m   "id": "4ec0d849-8975-458a-8d28-a17e143487e4",[m
[32m+[m[32m   "metadata": {},[m
[32m+[m[32m   "outputs": [],[m
[32m+[m[32m   "source": [[m
[32m+[m[32m    "# Handling only important columns with missing values\n",[m
[32m+[m[32m    "for _df in [df_movie, df_tv]:\n",[m
[32m+[m[32m    "    for col in ['IMDb', 'Age_Min', 'RottenTomatoes_Score']:\n",[m
[32m+[m[32m    "        _df[col] = _df[col].fillna(_df[col].median())\n",[m
[32m+[m[32m    "\n",[m
[32m+[m[32m    "    for col in ['Genre', 'Country', 'Language']:\n",[m
[32m+[m[32m    "        mode = _df[col].mode(dropna=True)\n",[m
[32m+[m[32m    "        fill_val = mode.iloc[0] if len(mode) > 0 else \"Unknown\"\n",[m
[32m+[m[32m    "        _df[col] = _df[col].fillna(fill_val)\n",[m
[32m+[m[32m    "        \n",[m
[32m+[m[32m    "    "[m
[32m+[m[32m   ][m
[32m+[m[32m  },[m
[32m+[m[32m  {[m
[32m+[m[32m   "cell_type": "code",[m
[32m+[m[32m   "execution_count": 13,[m
[32m+[m[32m   "id": "b7df5580-7945-4ea8-b31b-278ed98e696b",[m
[32m+[m[32m   "metadata": {},[m
[32m+[m[32m   "outputs": [[m
[32m+[m[32m    {[m
[32m+[m[32m     "name": "stdout",[m
[32m+[m[32m     "output_type": "stream",[m
[32m+[m[32m     "text": [[m
[32m+[m[32m      "<class 'pandas.DataFrame'>\n",[m
[32m+[m[32m      "RangeIndex: 9515 entries, 0 to 9514\n",[m
[32m+[m[32m      "Data columns (total 15 columns):\n",[m
[32m+[m[32m      " #   Column                Non-Null Count  Dtype  \n",[m
[32m+[m[32m      "---  ------                --------------  -----  \n",[m
[32m+[m[32m      " 0   ID                    9515 non-null   int64  \n",[m
[32m+[m[32m      " 1   Title                 9515 non-null   str    \n",[m
[32m+[m[32m      " 2   Year                  9515 non-null   int64  \n",[m
[32m+[m[32m      " 3   Netflix               9515 non-null   int64  \n",[m
[32m+[m[32m      " 4   Hulu                  9515 non-null   int64  \n",[m
[32m+[m[32m      " 5   Prime Video           9515 non-null   int64  \n",[m
[32m+[m[32m      " 6   Disney+               9515 non-null   int64  \n",[m
[32m+[m[32m      " 7   Type                  9515 non-null   str    \n",[m
[32m+[m[32m      " 8   Genre                 9515 non-null   str    \n",[m
[32m+[m[32m      " 9   Country               9515 non-null   str    \n",[m
[32m+[m[32m      " 10  Language              9515 non-null   str    \n",[m
[32m+[m[32m      " 11  IMDb                  9515 non-null   float64\n",[m
[32m+[m[32m      " 12  IMDb_ID               6787 non-null   str    \n",[m
[32m+[m[32m      " 13  Age_Min               9515 non-null   float64\n",[m
[32m+[m[32m      " 14  RottenTomatoes_Score  9515 non-null   float64\n",[m
[32m+[m[32m      "dtypes: float64(3), int64(6), str(6)\n",[m
[32m+[m[32m      "memory usage: 1.1 MB\n"[m
[32m+[m[32m     ][m
[32m+[m[32m    }[m
[32m+[m[32m   ],[m
[32m+[m[32m   "source": [[m
[32m+[m[32m    "df_movie.info()"[m
[32m+[m[32m   ][m
[32m+[m[32m  },[m
[32m+[m[32m  {[m
[32m+[m[32m   "cell_type": "code",[m
[32m+[m[32m   "execution_count": 14,[m
[32m+[m[32m   "id": "de066da1-655e-43cf-9b04-58818546788a",[m
[32m+[m[32m   "metadata": {},[m
[32m+[m[32m   "outputs": [[m
[32m+[m[32m    {[m
[32m+[m[32m     "name": "stdout",[m
[32m+[m[32m     "output_type": "stream",[m
[32m+[m[32m     "text": [[m
[32m+[m[32m      "<class 'pandas.DataFrame'>\n",[m
[32m+[m[32m      "RangeIndex: 5368 entries, 0 to 5367\n",[m
[32m+[m[32m      "Data columns (total 15 columns):\n",[m
[32m+[m[32m      " #   Column                Non-Null Count  Dtype  \n",[m
[32m+[m[32m      "---  ------                --------------  -----  \n",[m
[32m+[m[32m      " 0   ID                    5368 non-null   int64  \n",[m
[32m+[m[32m      " 1   Title                 5368 non-null   str    \n",[m
[32m+[m[32m      " 2   Year                  5368 non-null   int64  \n",[m
[32m+[m[32m      " 3   Netflix               5368 non-null   int64  \n",[m
[32m+[m[32m      " 4   Hulu                  5368 non-null   int64  \n",[m
[32m+[m[32m      " 5   Prime Video           5368 non-null   int64  \n",[m
[32m+[m[32m      " 6   Disney+               5368 non-null   int64  \n",[m
[32m+[m[32m      " 7   Type                  5368 non-null   str    \n",[m
[32m+[m[32m      " 8   Genre                 5368 non-null   str    \n",[m
[32m+[m[32m      " 9   Country               5368 non-null   str    \n",[m
[32m+[m[32m      " 10  Language              5368 non-null   str    \n",[m
[32m+[m[32m      " 11  IMDb_ID               2688 non-null   str    \n",[m
[32m+[m[32m      " 12  Age_Min               5368 non-null   float64\n",[m
[32m+[m[32m      " 13  RottenTomatoes_Score  5368 non-null   int64  \n",[m
[32m+[m[32m      " 14  IMDb                  5368 non-null   float64\n",[m
[32m+[m[32m      "dtypes: float64(2), int64(7), str(6)\n",[m
[32m+[m[32m      "memory usage: 629.2 KB\n"[m
[32m+[m[32m     ][m
[32m+[m[32m    }[m
[32m+[m[32m   ],[m
[32m+[m[32m   "source": [[m
[32m+[m[32m    "df_tv.info()"[m
[32m+[m[32m   ][m
[32m+[m[32m  },[m
[32m+[m[32m  {[m
[32m+[m[32m   "cell_type": "code",[m
[32m+[m[32m   "execution_count": 15,[m
[32m+[m[32m   "id": "11f0357e-06ea-4202-b9db-fb5236b3cde0",[m
[32m+[m[32m   "metadata": {},[m
[32m+[m[32m   "outputs": [[m
[32m+[m[32m    {[m
[32m+[m[32m     "data": {[m
[32m+[m[32m      "text/html": [[m
[32m+[m[32m       "<div>\n",[m
[32m+[m[32m       "<style scoped>\n",[m
[32m+[m[32m       "    .dataframe tbody tr th:only-of-type {\n",[m
[32m+[m[32m       "        vertical-align: middle;\n",[m
[32m+[m[32m       "    }\n",[m
[32m+[m[32m       "\n",[m
[32m+[m[32m       "    .dataframe tbody tr th {\n",[m
[32m+[m[32m       "        vertical-align: top;\n",[m
[32m+[m[32m       "    }\n",[m
[32m+[m[32m       "\n",[m
[32m+[m[32m       "    .dataframe thead th {\n",[m
[32m+[m[32m       "        text-align: right;\n",[m
[32m+[m[32m       "    }\n",[m
[32m+[m[32m       "</style>\n",[m
[32m+[m[32m       "<table border=\"1\" class=\"dataframe\">\n",[m
[32m+[m[32m       "  <thead>\n",[m
[32m+[m[32m       "    <tr style=\"text-align: right;\">\n",[m
[32m+[m[32m       "      <th></th>\n",[m
[32m+[m[32m       "      <th>ID</th>\n",[m
[32m+[m[32m       "      <th>Title</th>\n",[m
[32m+[m[32m       "      <th>Year</th>\n",[m
[32m+[m[32m       "      <th>Netflix</th>\n",[m
[32m+[m[32m       "      <th>Hulu</th>\n",[m
[32m+[m[32m       "      <th>Prime Video</th>\n",[m
[32m+[m[32m       "      <th>Disney+</th>\n",[m
[32m+[m[32m       "      <th>Type</th>\n",[m
[32m+[m[32m       "      <th>Genre</th>\n",[m
[32m+[m[32m       "      <th>Country</th>\n",[m
[32m+[m[32m       "      <th>Language</th>\n",[m
[32m+[m[32m       "      <th>IMDb</th>\n",[m
[32m+[m[32m       "      <th>IMDb_ID</th>\n",[m
[32m+[m[32m       "      <th>Age_Min</th>\n",[m
[32m+[m[32m       "      <th>RottenTomatoes_Score</th>\n",[m
[32m+[m[32m       "    </tr>\n",[m
[32m+[m[32m       "  </thead>\n",[m
[32m+[m[32m       "  <tbody>\n",[m
[32m+[m[32m       "    <tr>\n",[m
[32m+[m[32m       "      <th>0</th>\n",[m
[32m+[m[32m       "      <td>1</td>\n",[m
[32m+[m[32m       "      <td>The Irishman</td>\n",[m
[32m+[m[32m       "      <td>2019</td>\n",[m
[32m+[m[32m       "      <td>1</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>movie</td>\n",[m
[32m+[m[32m       "      <td>Biography, Crime, Drama</td>\n",[m
[32m+[m[32m       "      <td>United States</td>\n",[m
[32m+[m[32m       "      <td>English, Italian, Latin, Spanish, German</td>\n",[m
[32m+[m[32m       "      <td>7.8</td>\n",[m
[32m+[m[32m       "      <td>tt1302006</td>\n",[m
[32m+[m[32m       "      <td>18.0</td>\n",[m
[32m+[m[32m       "      <td>98.0</td>\n",[m
[32m+[m[32m       "    </tr>\n",[m
[32m+[m[32m       "    <tr>\n",[m
[32m+[m[32m       "      <th>1</th>\n",[m
[32m+[m[32m       "      <td>2</td>\n",[m
[32m+[m[32m       "      <td>Dangal</td>\n",[m
[32m+[m[32m       "      <td>2016</td>\n",[m
[32m+[m[32m       "      <td>1</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>movie</td>\n",[m
[32m+[m[32m       "      <td>Action, Biography, Drama</td>\n",[m
[32m+[m[32m       "      <td>India, United States</td>\n",[m
[32m+[m[32m       "      <td>Hindi, English</td>\n",[m
[32m+[m[32m       "      <td>8.3</td>\n",[m
[32m+[m[32m       "      <td>tt5074352</td>\n",[m
[32m+[m[32m       "      <td>7.0</td>\n",[m
[32m+[m[32m       "      <td>97.0</td>\n",[m
[32m+[m[32m       "    </tr>\n",[m
[32m+[m[32m       "    <tr>\n",[m
[32m+[m[32m       "      <th>2</th>\n",[m
[32m+[m[32m       "      <td>3</td>\n",[m
[32m+[m[32m       "      <td>David Attenborough: A Life on Our Planet</td>\n",[m
[32m+[m[32m       "      <td>2020</td>\n",[m
[32m+[m[32m       "      <td>1</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>movie</td>\n",[m
[32m+[m[32m       "      <td>Documentary, Biography</td>\n",[m
[32m+[m[32m       "      <td>United Kingdom</td>\n",[m
[32m+[m[32m       "      <td>English</td>\n",[m
[32m+[m[32m       "      <td>8.9</td>\n",[m
[32m+[m[32m       "      <td>tt11989890</td>\n",[m
[32m+[m[32m       "      <td>7.0</td>\n",[m
[32m+[m[32m       "      <td>95.0</td>\n",[m
[32m+[m[32m       "    </tr>\n",[m
[32m+[m[32m       "    <tr>\n",[m
[32m+[m[32m       "      <th>3</th>\n",[m
[32m+[m[32m       "      <td>4</td>\n",[m
[32m+[m[32m       "      <td>Lagaan: Once Upon a Time in India</td>\n",[m
[32m+[m[32m       "      <td>2001</td>\n",[m
[32m+[m[32m       "      <td>1</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>movie</td>\n",[m
[32m+[m[32m       "      <td>Drama, Musical, Sport</td>\n",[m
[32m+[m[32m       "      <td>India, United States</td>\n",[m
[32m+[m[32m       "      <td>Hindi, English</td>\n",[m
[32m+[m[32m       "      <td>8.1</td>\n",[m
[32m+[m[32m       "      <td>tt0169102</td>\n",[m
[32m+[m[32m       "      <td>7.0</td>\n",[m
[32m+[m[32m       "      <td>94.0</td>\n",[m
[32m+[m[32m       "    </tr>\n",[m
[32m+[m[32m       "    <tr>\n",[m
[32m+[m[32m       "      <th>4</th>\n",[m
[32m+[m[32m       "      <td>5</td>\n",[m
[32m+[m[32m       "      <td>Roma</td>\n",[m
[32m+[m[32m       "      <td>2018</td>\n",[m
[32m+[m[32m       "      <td>1</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>movie</td>\n",[m
[32m+[m[32m       "      <td>Drama</td>\n",[m
[32m+[m[32m       "      <td>Mexico, United States</td>\n",[m
[32m+[m[32m       "      <td>Spanish, Mixtec, English, Japanese, German, Fr...</td>\n",[m
[32m+[m[32m       "      <td>7.6</td>\n",[m
[32m+[m[32m       "      <td>tt6155172</td>\n",[m
[32m+[m[32m       "      <td>18.0</td>\n",[m
[32m+[m[32m       "      <td>94.0</td>\n",[m
[32m+[m[32m       "    </tr>\n",[m
[32m+[m[32m       "  </tbody>\n",[m
[32m+[m[32m       "</table>\n",[m
[32m+[m[32m       "</div>"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "text/plain": [[m
[32m+[m[32m       "   ID                                     Title  Year  Netflix  Hulu  \\\n",[m
[32m+[m[32m       "0   1                              The Irishman  2019        1     0   \n",[m
[32m+[m[32m       "1   2                                    Dangal  2016        1     0   \n",[m
[32m+[m[32m       "2   3  David Attenborough: A Life on Our Planet  2020        1     0   \n",[m
[32m+[m[32m       "3   4         Lagaan: Once Upon a Time in India  2001        1     0   \n",[m
[32m+[m[32m       "4   5                                      Roma  2018        1     0   \n",[m
[32m+[m[32m       "\n",[m
[32m+[m[32m       "   Prime Video  Disney+   Type                     Genre  \\\n",[m
[32m+[m[32m       "0            0        0  movie   Biography, Crime, Drama   \n",[m
[32m+[m[32m       "1            0        0  movie  Action, Biography, Drama   \n",[m
[32m+[m[32m       "2            0        0  movie    Documentary, Biography   \n",[m
[32m+[m[32m       "3            0        0  movie     Drama, Musical, Sport   \n",[m
[32m+[m[32m       "4            0        0  movie                     Drama   \n",[m
[32m+[m[32m       "\n",[m
[32m+[m[32m       "                 Country                                           Language  \\\n",[m
[32m+[m[32m       "0          United States           English, Italian, Latin, Spanish, German   \n",[m
[32m+[m[32m       "1   India, United States                                     Hindi, English   \n",[m
[32m+[m[32m       "2         United Kingdom                                            English   \n",[m
[32m+[m[32m       "3   India, United States                                     Hindi, English   \n",[m
[32m+[m[32m       "4  Mexico, United States  Spanish, Mixtec, English, Japanese, German, Fr...   \n",[m
[32m+[m[32m       "\n",[m
[32m+[m[32m       "   IMDb     IMDb_ID  Age_Min  RottenTomatoes_Score  \n",[m
[32m+[m[32m       "0   7.8   tt1302006     18.0                  98.0  \n",[m
[32m+[m[32m       "1   8.3   tt5074352      7.0                  97.0  \n",[m
[32m+[m[32m       "2   8.9  tt11989890      7.0                  95.0  \n",[m
[32m+[m[32m       "3   8.1   tt0169102      7.0                  94.0  \n",[m
[32m+[m[32m       "4   7.6   tt6155172     18.0                  94.0  "[m
[32m+[m[32m      ][m
[32m+[m[32m     },[m
[32m+[m[32m     "execution_count": 15,[m
[32m+[m[32m     "metadata": {},[m
[32m+[m[32m     "output_type": "execute_result"[m
[32m+[m[32m    }[m
[32m+[m[32m   ],[m
[32m+[m[32m   "source": [[m
[32m+[m[32m    "df_movie.head()"[m
[32m+[m[32m   ][m
[32m+[m[32m  },[m
[32m+[m[32m  {[m
[32m+[m[32m   "cell_type": "code",[m
[32m+[m[32m   "execution_count": 16,[m
[32m+[m[32m   "id": "5eab4ed1-ba4a-419d-a837-e2b85992b3b7",[m
[32m+[m[32m   "metadata": {},[m
[32m+[m[32m   "outputs": [[m
[32m+[m[32m    {[m
[32m+[m[32m     "data": {[m
[32m+[m[32m      "text/html": [[m
[32m+[m[32m       "<div>\n",[m
[32m+[m[32m       "<style scoped>\n",[m
[32m+[m[32m       "    .dataframe tbody tr th:only-of-type {\n",[m
[32m+[m[32m       "        vertical-align: middle;\n",[m
[32m+[m[32m       "    }\n",[m
[32m+[m[32m       "\n",[m
[32m+[m[32m       "    .dataframe tbody tr th {\n",[m
[32m+[m[32m       "        vertical-align: top;\n",[m
[32m+[m[32m       "    }\n",[m
[32m+[m[32m       "\n",[m
[32m+[m[32m       "    .dataframe thead th {\n",[m
[32m+[m[32m       "        text-align: right;\n",[m
[32m+[m[32m       "    }\n",[m
[32m+[m[32m       "</style>\n",[m
[32m+[m[32m       "<table border=\"1\" class=\"dataframe\">\n",[m
[32m+[m[32m       "  <thead>\n",[m
[32m+[m[32m       "    <tr style=\"text-align: right;\">\n",[m
[32m+[m[32m       "      <th></th>\n",[m
[32m+[m[32m       "      <th>ID</th>\n",[m
[32m+[m[32m       "      <th>Title</th>\n",[m
[32m+[m[32m       "      <th>Year</th>\n",[m
[32m+[m[32m       "      <th>Netflix</th>\n",[m
[32m+[m[32m       "      <th>Hulu</th>\n",[m
[32m+[m[32m       "      <th>Prime Video</th>\n",[m
[32m+[m[32m       "      <th>Disney+</th>\n",[m
[32m+[m[32m       "      <th>Type</th>\n",[m
[32m+[m[32m       "      <th>Genre</th>\n",[m
[32m+[m[32m       "      <th>Country</th>\n",[m
[32m+[m[32m       "      <th>Language</th>\n",[m
[32m+[m[32m       "      <th>IMDb_ID</th>\n",[m
[32m+[m[32m       "      <th>Age_Min</th>\n",[m
[32m+[m[32m       "      <th>RottenTomatoes_Score</th>\n",[m
[32m+[m[32m       "      <th>IMDb</th>\n",[m
[32m+[m[32m       "    </tr>\n",[m
[32m+[m[32m       "  </thead>\n",[m
[32m+[m[32m       "  <tbody>\n",[m
[32m+[m[32m       "    <tr>\n",[m
[32m+[m[32m       "      <th>0</th>\n",[m
[32m+[m[32m       "      <td>1</td>\n",[m
[32m+[m[32m       "      <td>Breaking Bad</td>\n",[m
[32m+[m[32m       "      <td>2008</td>\n",[m
[32m+[m[32m       "      <td>1</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>tv_show</td>\n",[m
[32m+[m[32m       "      <td>crime television series, drama television seri...</td>\n",[m
[32m+[m[32m       "      <td>United States</td>\n",[m
[32m+[m[32m       "      <td>American English, Spanish language in the Amer...</td>\n",[m
[32m+[m[32m       "      <td>tt0903747</td>\n",[m
[32m+[m[32m       "      <td>18.0</td>\n",[m
[32m+[m[32m       "      <td>100</td>\n",[m
[32m+[m[32m       "      <td>10.0</td>\n",[m
[32m+[m[32m       "    </tr>\n",[m
[32m+[m[32m       "    <tr>\n",[m
[32m+[m[32m       "      <th>1</th>\n",[m
[32m+[m[32m       "      <td>2</td>\n",[m
[32m+[m[32m       "      <td>Stranger Things</td>\n",[m
[32m+[m[32m       "      <td>2016</td>\n",[m
[32m+[m[32m       "      <td>1</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>tv_show</td>\n",[m
[32m+[m[32m       "      <td>science fiction television program, horror tel...</td>\n",[m
[32m+[m[32m       "      <td>United States</td>\n",[m
[32m+[m[32m       "      <td>English</td>\n",[m
[32m+[m[32m       "      <td>tt4574334</td>\n",[m
[32m+[m[32m       "      <td>16.0</td>\n",[m
[32m+[m[32m       "      <td>96</td>\n",[m
[32m+[m[32m       "      <td>9.0</td>\n",[m
[32m+[m[32m       "    </tr>\n",[m
[32m+[m[32m       "    <tr>\n",[m
[32m+[m[32m       "      <th>2</th>\n",[m
[32m+[m[32m       "      <td>3</td>\n",[m
[32m+[m[32m       "      <td>Attack on Titan</td>\n",[m
[32m+[m[32m       "      <td>2013</td>\n",[m
[32m+[m[32m       "      <td>1</td>\n",[m
[32m+[m[32m       "      <td>1</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>tv_show</td>\n",[m
[32m+[m[32m       "      <td>reality television</td>\n",[m
[32m+[m[32m       "      <td>United States</td>\n",[m
[32m+[m[32m       "      <td>English</td>\n",[m
[32m+[m[32m       "      <td>NaN</td>\n",[m
[32m+[m[32m       "      <td>18.0</td>\n",[m
[32m+[m[32m       "      <td>95</td>\n",[m
[32m+[m[32m       "      <td>9.0</td>\n",[m
[32m+[m[32m       "    </tr>\n",[m
[32m+[m[32m       "    <tr>\n",[m
[32m+[m[32m       "      <th>3</th>\n",[m
[32m+[m[32m       "      <td>4</td>\n",[m
[32m+[m[32m       "      <td>Better Call Saul</td>\n",[m
[32m+[m[32m       "      <td>2015</td>\n",[m
[32m+[m[32m       "      <td>1</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>tv_show</td>\n",[m
[32m+[m[32m       "      <td>legal drama, crime television series</td>\n",[m
[32m+[m[32m       "      <td>United States</td>\n",[m
[32m+[m[32m       "      <td>English</td>\n",[m
[32m+[m[32m       "      <td>tt3032476</td>\n",[m
[32m+[m[32m       "      <td>18.0</td>\n",[m
[32m+[m[32m       "      <td>94</td>\n",[m
[32m+[m[32m       "      <td>10.0</td>\n",[m
[32m+[m[32m       "    </tr>\n",[m
[32m+[m[32m       "    <tr>\n",[m
[32m+[m[32m       "      <th>4</th>\n",[m
[32m+[m[32m       "      <td>5</td>\n",[m
[32m+[m[32m       "      <td>Dark</td>\n",[m
[32m+[m[32m       "      <td>2017</td>\n",[m
[32m+[m[32m       "      <td>1</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>0</td>\n",[m
[32m+[m[32m       "      <td>tv_show</td>\n",[m
[32m+[m[32m       "      <td>science fiction television program, drama tele...</td>\n",[m
[32m+[m[32m       "      <td>Germany</td>\n",[m
[32m+[m[32m       "      <td>German</td>\n",[m
[32m+[m[32m       "      <td>tt5753856</td>\n",[m
[32m+[m[32m       "      <td>16.0</td>\n",[m
[32m+[m[32m       "      <td>93</td>\n",[m
[32m+[m[32m       "      <td>10.0</td>\n",[m
[32m+[m[32m       "    </tr>\n",[m
[32m+[m[32m       "  </tbody>\n",[m
[32m+[m[32m       "</table>\n",[m
[32m+[m[32m       "</div>"[m
[32m+[m[32m      ],[m
[32m+[m[32m      "text/plain": [[m
[32m+[m[32m       "   ID             Title  Year  Netflix  Hulu  Prime Video  Disney+     Type  \\\n",[m
[32m+[m[32m       "0   1      Breaking Bad  2008        1     0            0        0  tv_show   \n",[m
[32m+[m[32m       "1   2   Stranger Things  2016        1     0            0        0  tv_show   \n",[m
[32m+[m[32m       "2   3   Attack on Titan  2013        1     1            0        0  tv_show   \n",[m
[32m+[m[32m       "3   4  Better Call Saul  2015        1     0            0        0  tv_show   \n",[m
[32m+[m[32m       "4   5              Dark  2017        1     0            0        0  tv_show   \n",[m
[32m+[m[32m       "\n",[m
[32m+[m[32m       "                                               Genre        Country  \\\n",[m
[32m+[m[32m       "0  crime television series, drama television seri...  United States   \n",[m
[32m+[m[32m       "1  science fiction television program, horror tel...  United States   \n",[m
[32m+[m[32m       "2                                 reality television  United States   \n",[m
[32m+[m[32m       "3               legal drama, crime television series  United States   \n",[m
[32m+[m[32m       "4  science fiction television program, drama tele...        Germany   \n",[m
[32m+[m[32m       "\n",[m
[32m+[m[32m       "                                            Language    IMDb_ID  Age_Min  \\\n",[m
[32m+[m[32m       "0  American English, Spanish language in the Amer...  tt0903747     18.0   \n",[m
[32m+[m[32m       "1                                            English  tt4574334     16.0   \n",[m
[32m+[m[32m       "2                                            English        NaN     18.0   \n",[m
[32m+[m[32m       "3                                            English  tt3032476     18.0   \n",[m
[32m+[m[32m       "4                                             German  tt5753856     16.0   \n",[m
[32m+[m[32m       "\n",[m
[32m+[m[32m       "   RottenTomatoes_Score  IMDb  \n",[m
[32m+[m[32m       "0                   100  10.0  \n",[m
[32m+[m[32m       "1                    96   9.0  \n",[m
[32m+[m[32m       "2                    95   9.0  \n",[m
[32m+[m[32m       "3                    94  10.0  \n",[m
[32m+[m[32m       "4                    93  10.0  "[m
[32m+[m[32m      ][m
[32m+[m[32m     },[m
[32m+[m[32m     "execution_count": 16,[m
[32m+[m[32m     "metadata": {},[m
[32m+[m[32m     "output_type": "execute_result"[m
[32m+[m[32m    }[m
[32m+[m[32m   ],[m
[32m+[m[32m   "source": [[m
[32m+[m[32m    "df_tv.head()"[m
[32m+[m[32m   ][m
[32m+[m[32m  },[m
[32m+[m[32m  {[m
[32m+[m[32m   "cell_type": "code",[m
[32m+[m[32m   "execution_count": null,[m
[32m+[m[32m   "id": "70e92656-a498-4857-87a7-7c17e2958bbd",[m
[32m+[m[32m   "metadata": {},[m
[32m+[m[32m   "outputs": [],[m
[32m+[m[32m   "source": [][m
[32m+[m[32m  }[m
[32m+[m[32m ],[m
[32m+[m[32m "metadata": {[m
[32m+[m[32m  "kernelspec": {[m
[32m+[m[32m   "display_name": "Python 3 (ipykernel)",[m
[32m+[m[32m   "language": "python",[m
[32m+[m[32m   "name": "python3"[m
[32m+[m[32m  },[m
[32m+[m[32m  "language_info": {[m
[32m+[m[32m   "codemirror_mode": {[m
[32m+[m[32m    "name": "ipython",[m
[32m+[m[32m    "version": 3[m
[32m+[m[32m   },[m
[32m+[m[32m   "file_extension": ".py",[m
[32m+[m[32m   "mimetype": "text/x-python",[m
[32m+[m[32m   "name": "python",[m
[32m+[m[32m   "nbconvert_exporter": "python",[m
[32m+[m[32m   "pygments_lexer": "ipython3",[m
[32m+[m[32m   "version": "3.12.13"[m
[32m+[m[32m  }[m
[32m+[m[32m },[m
[32m+[m[32m "nbformat": 4,[m
[32m+[m[32m "nbformat_minor": 5[m
[32m+[m[32m}[m
