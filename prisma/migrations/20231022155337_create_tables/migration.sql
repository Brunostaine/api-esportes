-- CreateTable
CREATE TABLE "users" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,
    "update_at" TIMESTAMP(3) DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Championships" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "type" TEXT NOT NULL,
    "team_id" TEXT NOT NULL,

    CONSTRAINT "Championships_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Teams" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,

    CONSTRAINT "Teams_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Players" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "age" TEXT NOT NULL,
    "nationality" TEXT NOT NULL,
    "team_id" TEXT NOT NULL,

    CONSTRAINT "Players_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "StatisticsPlayers" (
    "id" TEXT NOT NULL,
    "namePlayer" TEXT NOT NULL,
    "yellowCards" TEXT NOT NULL,
    "redCards" TEXT NOT NULL,
    "games" TEXT NOT NULL,
    "goals" TEXT NOT NULL,
    "player_id" TEXT NOT NULL,

    CONSTRAINT "StatisticsPlayers_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "CoachingStaffs" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "age" TEXT NOT NULL,
    "nationality" TEXT NOT NULL,
    "role" TEXT NOT NULL,
    "team_id" TEXT NOT NULL,
    "coach_id" TEXT NOT NULL,

    CONSTRAINT "CoachingStaffs_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Coachs" (
    "id" TEXT NOT NULL,
    "name" TEXT NOT NULL,
    "age" TEXT NOT NULL,
    "nationality" TEXT NOT NULL,
    "role" TEXT NOT NULL,
    "team_id" TEXT NOT NULL,

    CONSTRAINT "Coachs_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "Championships_team_id_key" ON "Championships"("team_id");

-- CreateIndex
CREATE UNIQUE INDEX "Players_team_id_key" ON "Players"("team_id");

-- CreateIndex
CREATE UNIQUE INDEX "StatisticsPlayers_player_id_key" ON "StatisticsPlayers"("player_id");

-- CreateIndex
CREATE UNIQUE INDEX "CoachingStaffs_team_id_key" ON "CoachingStaffs"("team_id");

-- CreateIndex
CREATE UNIQUE INDEX "CoachingStaffs_coach_id_key" ON "CoachingStaffs"("coach_id");

-- CreateIndex
CREATE UNIQUE INDEX "Coachs_team_id_key" ON "Coachs"("team_id");

-- AddForeignKey
ALTER TABLE "Championships" ADD CONSTRAINT "Championships_team_id_fkey" FOREIGN KEY ("team_id") REFERENCES "Teams"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Players" ADD CONSTRAINT "Players_team_id_fkey" FOREIGN KEY ("team_id") REFERENCES "Teams"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "StatisticsPlayers" ADD CONSTRAINT "StatisticsPlayers_player_id_fkey" FOREIGN KEY ("player_id") REFERENCES "Players"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CoachingStaffs" ADD CONSTRAINT "CoachingStaffs_team_id_fkey" FOREIGN KEY ("team_id") REFERENCES "Teams"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "CoachingStaffs" ADD CONSTRAINT "CoachingStaffs_coach_id_fkey" FOREIGN KEY ("coach_id") REFERENCES "Coachs"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Coachs" ADD CONSTRAINT "Coachs_team_id_fkey" FOREIGN KEY ("team_id") REFERENCES "Teams"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
