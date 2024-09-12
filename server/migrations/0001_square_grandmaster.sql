CREATE TABLE IF NOT EXISTS "goal_completations" (
	"id" text PRIMARY KEY NOT NULL,
	"goal_id" text NOT NULL
);
--> statement-breakpoint
DO $$ BEGIN
 ALTER TABLE "goal_completations" ADD CONSTRAINT "goal_completations_goal_id_goals_id_fk" FOREIGN KEY ("goal_id") REFERENCES "public"."goals"("id") ON DELETE no action ON UPDATE no action;
EXCEPTION
 WHEN duplicate_object THEN null;
END $$;
